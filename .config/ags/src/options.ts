import { Gtk } from "ags/gtk4";

export const theme = {
    spacing: 12,
    radius: 12,
    "icon-size": {
        normal: 20,
        large: 64,
    },
    window: {
        margin: 12,
        padding: 16,
        border: { width: 1, color: "rgba(255, 255, 255, 0.1)" },
    },
};

export const config = {
    transition: 0.2, // seconds
    bar: {
        modules: {
            powermenu: {
                "on-click": "toggle-powermenu",
                "on-click-right": null,
                "on-click-middle": null,
                format: "{icon}",
            },
        },
    },
};
