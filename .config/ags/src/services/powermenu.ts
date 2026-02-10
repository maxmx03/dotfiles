import { windows_names } from "@/windows";
import GObject, { getter, property, register, signal } from "ags/gobject";
import app from "ags/gtk4/app";
import GLib from "gi://GLib?version=2.0";
import { Timer } from "@/lib/timer";
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

    constructor() {
        super();
        this.#timer.subscribe(async () => {
            if (this.#timer.timeLeft <= 0) {
                this.executeCommand();
            }
        });
    }

    #title = "";
    #label = "";
    #cmd = "";
    #timer = new Timer(60); // 60 seconds

    @getter(String)
    get title() {
        return this.#title;
    }

    @getter(String)
    get label() {
        return this.#label;
    }

    @getter(String)
    get cmd() {
        return this.#cmd;
    }

    get timer() {
        return this.#timer;
    }

    async executeCommand() {
        this.#timer.cancel();
        await bash(this.#cmd);
        app.get_window(windows_names.verification)?.hide();
    }

    cancelAction() {
        this.#timer.cancel();
        app.get_window(windows_names.verification)?.hide();
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
