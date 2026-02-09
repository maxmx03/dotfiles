import app from "ags/gtk4/app";
import { Astal, Gdk, Gtk } from "ags/gtk4";

export default function Calendar(gdkmonitor: Gdk.Monitor) {
    const { TOP, RIGHT } = Astal.WindowAnchor;

    return (
        <window
            name="calendar"
            anchor={TOP}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            keymode={Astal.Keymode.ON_DEMAND}
            visible={false}
            application={app}
            layer={Astal.Layer.OVERLAY}
            marginRight={12}
            marginTop={12}
        >
            <box cssClasses={["calendar-container"]}>
                <Gtk.Calendar />
            </box>
        </window>
    );
}
