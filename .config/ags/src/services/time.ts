import GLib from "gi://GLib?version=2.0";
import { createPoll } from "ags/time";

export const time = createPoll(
    GLib.DateTime.new_now_local(),
    1000,
    () => GLib.DateTime.new_now_local()
);
