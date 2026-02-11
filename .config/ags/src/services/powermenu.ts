import { windows_names } from "@/windows";
import GObject, { register } from "ags/gobject";
import app from "ags/gtk4/app";
import GLib from "gi://GLib?version=2.0";
import { bash } from "@/lib/utils";

const user = GLib.get_user_name();

const commands = {
    sleep: "systemctl suspend",
    reboot: "systemctl reboot",
    logout: `loginctl terminate-user ${user}`,
    shutdown: "shutdown now",
};

@register({ GTypeName: "PowerMenu" })
export default class PowerMenu extends GObject.Object {
    static instance: PowerMenu;

    static get_default() {
        if (!this.instance) this.instance = new PowerMenu();
        return this.instance;
    }

    async action(action: string) {
        const actions: Record<string, string> = {
            Sleep: commands.sleep,
            Reboot: commands.reboot,
            Logout: commands.logout,
            Shutdown: commands.shutdown,
        };

        const cmd = actions[action];
        if (!cmd) return;

        await bash(cmd);
        app.get_window(windows_names.powermenu)?.hide();
    }
}
