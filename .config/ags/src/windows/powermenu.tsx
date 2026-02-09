import { windows_names } from "@/windows";
import { PowerMenuModule } from "@/modules/powermenu/powermenu";
import app from "ags/gtk4/app";
import PowerMenu from "@/services/powermenu";
import { VerificationModule } from "@/modules/powermenu/verification";
import { Popup } from "@/widgets/popup";

const powermenu = PowerMenu.get_default();

export function PowerMenuWindow() {
    return (
        <Popup name={windows_names.powermenu}>
            <PowerMenuModule />
        </Popup>
    );
}

export function VerificationWindow() {
    app.connect("window-toggled", (_, win) => {
        const winName = win.name;
        const visible = win.visible;

        if (winName === windows_names.verification && !visible) {
            powermenu.cancelAction();
        }
    });

    return (
        <Popup name={windows_names.verification}>
            <VerificationModule />
        </Popup>
    );
}
