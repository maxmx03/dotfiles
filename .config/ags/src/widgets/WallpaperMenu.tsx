import { Astal, Gdk, Gtk } from "ags/gtk4";
import { createBinding, createEffect, createState, For } from "ags";
import { execAsync } from "ags/process";
import app from "ags/gtk4/app";
import Gio from "gi://Gio?version=2.0";
import GLib from "gi://GLib?version=2.0";

const WALLPAPER_DIR = `${GLib.get_home_dir()}/Pictures/wallpapers`;

function getWallpapers() {
    try {
        const dir = Gio.File.new_for_path(WALLPAPER_DIR);
        const enumerator = dir.enumerate_children(
            "standard::name",
            Gio.FileQueryInfoFlags.NONE,
            null,
        );

        const files: string[] = [];
        let fileInfo;
        while ((fileInfo = enumerator.next_file(null))) {
            const name = fileInfo.get_name();
            if (name.match(/\.(jpg|jpeg|png|webp)$/i)) {
                files.push(name);
            }
        }
        return files.sort();
    } catch (error) {
        console.warn("Error reading wallpapers:", error);
        return [];
    }
}

function setWallpaper(filename: string) {
    const path = `${WALLPAPER_DIR}/${filename}`;
    execAsync(
        `awww img "${path}" --transition-fps 60 --transition-type wipe --transition-duration 3`,
    ).catch(console.error);
}

export default function WallpaperMenu({ onBack }: { onBack: () => void }) {
    const wallpapers = getWallpapers();

    // Group into rows of 3
    const rows = [];
    for (let i = 0; i < wallpapers.length; i += 3) {
        rows.push(wallpapers.slice(i, i + 3));
    }

    return (
        <box
            $type="named"
            orientation={Gtk.Orientation.VERTICAL}
            spacing={16}
            name="wallpaper"
            class="qs-page"
        >
            <box spacing={8}>
                <button
                    class="arrow-button"
                    onClicked={onBack}
                >
                    <image iconName="go-previous-symbolic" />
                </button>
                <label label="Wallpapers" cssClasses={["section-title"]} />
                <box hexpand />
                <button
                    class="icon-button"
                    tooltipText="Open Folder"
                    onClicked={() =>
                        execAsync(`xdg-open "${WALLPAPER_DIR}"`).catch(
                            console.error,
                        )}
                >
                    <image iconName="folder-symbolic" />
                </button>
            </box>

            <scrolledwindow heightRequest={300} propagateNaturalHeight>
                <box
                    orientation={Gtk.Orientation.VERTICAL}
                    spacing={8}
                    cssClasses={["wallpaper-grid"]}
                >
                    {rows.map((row) => (
                        <box spacing={8} homogeneous>
                            {row.map((wp) => (
                                <button
                                    class="wallpaper-button"
                                    onClicked={() => setWallpaper(wp)}
                                    tooltipText={wp}
                                >
                                    <box
                                        cssClasses={["wallpaper-preview"]}
                                        heightRequest={80}
                                    >
                                        <image
                                            file={`${WALLPAPER_DIR}/${wp}`}
                                            pixelSize={80}
                                        />
                                    </box>
                                </button>
                            ))}
                            {/* Fill empty slots in last row if needed */}
                            {row.length < 3 &&
                                Array(3 - row.length).fill(0).map(() => 
                                <box />)}
                        </box>
                    ))}
                </box>
            </scrolledwindow>
        </box>
    );
}
