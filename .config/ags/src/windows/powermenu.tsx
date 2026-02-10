import { windows_names } from "@/windows";
import { PowerMenuModule } from "@/modules/powermenu/powermenu";
import PowerMenu from "@/services/powermenu";
import { Popup } from "@/widgets/popup";

const powermenu = PowerMenu.get_default();

export function PowerMenuWindow() {
    return (
        <Popup name={windows_names.powermenu}>
            <PowerMenuModule />
        </Popup>
    );
}
