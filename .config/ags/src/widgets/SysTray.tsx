import { Gdk, Gtk } from "ags/gtk4";
import Tray from "gi://AstalTray?version=0.1";
import { createBinding, For } from "ags";

function TrayItem({ item }: { item: Tray.TrayItem }) {
    return (
        <box cssClasses={["tray-item"]}>
            <button
                tooltipMarkup={createBinding(item, "tooltipMarkup")}
                onClicked={() => item.activate(0, 0)}
                $={(self) => {
                    const popover = new Gtk.PopoverMenu({
                        menu_model: item.menuModel,
                        autohide: true,
                    });
                    popover.set_parent(self);
                    popover.insert_action_group("dbusmenu", item.actionGroup);

                    const gesture = new Gtk.GestureClick();
                    gesture.set_button(Gdk.BUTTON_SECONDARY);
                    gesture.connect("released", () => {
                        popover.popup();
                    });
                    self.add_controller(gesture);
                }}
            >
                <image iconName={createBinding(item, "iconName")} />
            </button>
        </box>
    );
}

export default function SysTray() {
    const tray = Tray.get_default();
    const items = createBinding(tray, "items");

    return (
        <box cssClasses={["systray"]}>
            <For each={items}>
                {(item) => <TrayItem item={item} />}
            </For>
        </box>
    );
}
