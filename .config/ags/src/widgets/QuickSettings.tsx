import { Astal, Gdk, Gtk } from "ags/gtk4";
import Wp from "gi://AstalWp?version=0.1";
import { createBinding, createEffect, createState, For } from "ags";
import app from "ags/gtk4/app";
import { execAsync } from "ags/process";
import Pango from "gi://Pango?version=1.0";
import WallpaperMenu from "./WallpaperMenu";

const [qs_page, qs_page_set] = createState("main");

export function showQSPage(page: string) {
    qs_page_set(page);
    app.toggle_window("quick-settings");
}

function VolumeSlider({ stream, icon }: { stream: any; icon: string }) {
    if (!stream) return <box />;

    const volume = createBinding(stream, "volume");
    const isMuted = createBinding(stream, "mute");

    return (
        <box cssClasses={["volume-slider-box"]} spacing={8}>
            <button
                class="icon-button"
                onClicked={() => {
                    if ("mute" in stream) stream.mute = !stream.mute;
                    else if ("set_mute" in stream) {
                        stream.set_mute(!stream.mute);
                    }
                }}
            >
                <image
                    iconName={isMuted((m) =>
                        m ? "audio-volume-muted-symbolic" : icon
                    )}
                />
            </button>
            <slider
                hexpand
                value={volume}
                onChangeValue={({ value }) => {
                    if ("volume" in stream) stream.volume = value;
                    else if ("set_volume" in stream) stream.set_volume(value);
                }}
            />
            <label label={volume((v) => `${Math.floor(v * 100)}%`)} />
        </box>
    );
}

function MainPage() {
    const wp = Wp.get_default()!;
    const speaker = wp.audio.defaultSpeaker;
    const microphone = wp.audio.defaultMicrophone;

    return (
        <box
            $type="named"
            orientation={Gtk.Orientation.VERTICAL}
            spacing={16}
            name="main"
            class="qs-page"
        >
            <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                <box spacing={8}>
                    <label
                        label="Volume"
                        halign={Gtk.Align.START}
                        hexpand
                        cssClasses={["section-title"]}
                    />
                    <button
                        class="arrow-button"
                        onClicked={() => qs_page_set("volume")}
                    >
                        <image iconName="go-next-symbolic" />
                    </button>
                </box>
                <VolumeSlider stream={speaker} icon="audio-speakers-symbolic" />
            </box>

            <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                <label
                    label="Microphone"
                    halign={Gtk.Align.START}
                    cssClasses={["section-title"]}
                />
                <VolumeSlider
                    stream={microphone}
                    icon="audio-input-microphone-symbolic"
                />
            </box>

            <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                <label
                    label="System"
                    halign={Gtk.Align.START}
                    cssClasses={["section-title"]}
                />
                <box spacing={8}>
                    <button
                        hexpand
                        class="qs-button"
                        onClicked={() => qs_page_set("wallpaper")}
                    >
                        <box spacing={8} halign={Gtk.Align.CENTER}>
                            <image iconName="preferences-desktop-wallpaper-symbolic" />
                            <label label="Wallpapers" />
                        </box>
                    </button>
                    <button
                        hexpand
                        class="qs-button"
                        onClicked={() =>
                            execAsync("pavucontrol").catch(console.error)}
                    >
                        <box spacing={8} halign={Gtk.Align.CENTER}>
                            <image iconName="multimedia-volume-control-symbolic" />
                            <label label="Mixer" />
                        </box>
                    </button>
                </box>
            </box>
        </box>
    );
}

function VolumePage() {
    const wp = Wp.get_default()!;
    const audio = wp.audio;
    const streams = createBinding(audio, "streams");

    return (
        <box
            $type="named"
            orientation={Gtk.Orientation.VERTICAL}
            spacing={16}
            name="volume"
            class="qs-page"
        >
            <box spacing={8}>
                <button
                    class="arrow-button"
                    onClicked={() => qs_page_set("main")}
                >
                    <image iconName="go-previous-symbolic" />
                </button>
                <label label="Detailed Volume" cssClasses={["section-title"]} />
            </box>

            <scrolledwindow heightRequest={300} propagateNaturalHeight>
                <box orientation={Gtk.Orientation.VERTICAL} spacing={12}>
                    <For each={streams}>
                        {(stream) => (
                            <box
                                orientation={Gtk.Orientation.VERTICAL}
                                spacing={4}
                            >
                                <label
                                    label={createBinding(stream, "description")}
                                    halign={Gtk.Align.START}
                                    cssClasses={["app-name"]}
                                    ellipsize={Pango.EllipsizeMode.END}
                                />
                                <VolumeSlider
                                    stream={stream}
                                    icon="audio-card-symbolic"
                                />
                            </box>
                        )}
                    </For>
                </box>
            </scrolledwindow>
        </box>
    );
}

export default function QuickSettings(gdkmonitor: Gdk.Monitor) {
    return (
        <window
            name="quick-settings"
            anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            keymode={Astal.Keymode.ON_DEMAND}
            visible={false}
            application={app}
            layer={Astal.Layer.OVERLAY}
            marginTop={12}
            marginRight={12}
        >
            <box class="quick-settings-container" widthRequest={380}>
                <stack
                    transitionType={Gtk.StackTransitionType.SLIDE_LEFT_RIGHT}
                    transitionDuration={300}
                    $={(self) => {
                        createEffect(() => {
                            self.set_visible_child_name(qs_page());
                        });
                    }}
                >
                    <MainPage />
                    <VolumePage />
                    <WallpaperMenu onBack={() => qs_page_set("main")} />
                </stack>
            </box>
        </window>
    );
}
