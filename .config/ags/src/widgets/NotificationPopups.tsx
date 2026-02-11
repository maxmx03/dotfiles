import { Astal, Gdk, Gtk } from "ags/gtk4";
import app from "ags/gtk4/app";
import Notifd from "gi://AstalNotifd?version=0.1";
import NotificationItem from "./NotificationItem";
import { createRoot, createState, For, onCleanup } from "ags";

const TIMEOUT_DELAY = 5000;

export default function NotificationPopups(gdkmonitor: Gdk.Monitor) {
    const { BOTTOM, RIGHT } = Astal.WindowAnchor;
    const notifd = Notifd.get_default();
    const [widgets, setWidgets] = createState<Gtk.Widget[]>([]);
    const map = new Map<number, Gtk.Widget>();
    const disposes = new Map<number, () => void>();

    const update = () => setWidgets([...map.values()].reverse());

    const onNotified = (_: any, id: number) => {
        if (notifd.dont_disturb) return;

        const n = notifd.get_notification(id);
        if (!n) return;

        // Use createRoot to provide a tracking context for the widget and its hooks
        createRoot((dispose) => {
            const widget = (
                <box cssClasses={["notification-popup-item"]}>
                    <NotificationItem n={n} />
                </box>
            ) as Gtk.Widget;

            map.set(id, widget);
            disposes.set(id, dispose);
            update();

            setTimeout(() => {
                const d = disposes.get(id);
                if (d) {
                    d(); // This clears the root scope and potentially destroys the widget
                    disposes.delete(id);
                    map.delete(id);
                    update();
                }
            }, TIMEOUT_DELAY);
        });
    };

    const onResolved = (_: any, id: number) => {
        const d = disposes.get(id);
        if (d) {
            d();
            disposes.delete(id);
            map.delete(id);
            update();
        }
    };

    const conn1 = notifd.connect("notified", onNotified);
    const conn2 = notifd.connect("resolved", onResolved);

    onCleanup(() => {
        notifd.disconnect(conn1);
        notifd.disconnect(conn2);
        disposes.forEach((d) => d());
    });

    return (
        <window
            name="notifications-popups"
            namespace="notifications-popups"
            application={app}
            visible={widgets((v) => v.length > 0)}
            anchor={BOTTOM | RIGHT}
            marginBottom={20}
            marginRight={20}
            gdkmonitor={gdkmonitor}
        >
            <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                <For each={widgets}>
                    {(widget) => widget}
                </For>
            </box>
        </window>
    );
}
