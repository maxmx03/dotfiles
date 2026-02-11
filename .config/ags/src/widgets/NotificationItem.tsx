import { Gtk } from "ags/gtk4";
import Pango from "gi://Pango?version=1.0";
import AstalNotifd from "gi://AstalNotifd?version=0.1";

export default function NotificationItem(
    { n }: { n: AstalNotifd.Notification },
) {
    return (
        <box
            cssClasses={["notification-item"]}
            orientation={Gtk.Orientation.VERTICAL}
            spacing={4}
        >
            <box spacing={8} cssClasses={["notification-header"]}>
                <image
                    iconName={n.app_icon ||
                        "preferences-system-notifications-symbolic"}
                    pixelSize={16}
                />
                <label
                    label={n.app_name || "Notification"}
                    cssClasses={["notification-app-name"]}
                    halign={Gtk.Align.START}
                    hexpand
                    ellipsize={Pango.EllipsizeMode.END}
                />
                <button
                    iconName="window-close-symbolic"
                    onClicked={() => n.dismiss()}
                />
            </box>
            <box orientation={Gtk.Orientation.VERTICAL} spacing={2}>
                <label
                    label={n.summary}
                    cssClasses={["notification-title"]}
                    halign={Gtk.Align.START}
                    xalign={0}
                    ellipsize={Pango.EllipsizeMode.END}
                />
                {n.body
                    ? (
                        <label
                            label={n.body}
                            cssClasses={["notification-body"]}
                            halign={Gtk.Align.START}
                            xalign={0}
                            wrap={true}
                            maxWidthChars={30}
                        />
                    )
                    : null}
            </box>
        </box>
    );
}
