import app from "ags/gtk4/app";

export const windows_names = {
    bar: "bar",
    powermenu: "powermenu",
    applauncher: "launcher",
    calendar: "calendar",
    quicksettings: "quick-settings",
};

export function hideWindows() {
    const ignore = [
        windows_names.bar,
    ];

    app.get_windows().forEach((win) => {
        if (!ignore.includes(win.name) && win.visible) {
            win.hide();
        }
    });
}

export function toggleWindow(name: string) {
    const win = app.get_window(name);
    if (!win) {
        console.warn(`Window ${name} not found`);
        return;
    }

    // @ts-ignore
    if (win.visible) {
        win.hide();
    } else {
        hideWindows();
        win.show();
    }
}
