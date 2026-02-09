import { Astal, Gdk, Gtk } from "ags/gtk4";
import Wp from "gi://AstalWp?version=0.1";
import { createBinding, For } from "ags";
import app from "ags/gtk4/app";

function VolumeSlider({ stream, icon }: { stream: any; icon: string }) {
    if (!stream) return <box />;

    const volume = createBinding(stream, "volume");
    const isMuted = createBinding(stream, "mute");

    return (
        <box cssClasses={["volume-slider-box"]} spacing={8}>
            <button
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

export default function VolumeMenu(gdkmonitor: Gdk.Monitor) {
    const wp = Wp.get_default()!;
    const audio = wp.audio;
    const speaker = audio.defaultSpeaker;
    const microphone = audio.defaultMicrophone;
    const streams = createBinding(audio, "streams");

    return (
        <window
            name="volume-menu"
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
            <box
                orientation={Gtk.Orientation.VERTICAL}
                class="volume-menu-container"
                widthRequest={350}
                spacing={16}
            >
                <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                    <label
                        label="Output"
                        halign={Gtk.Align.START}
                        cssClasses={["section-title"]}
                    />
                    <VolumeSlider
                        stream={speaker}
                        icon="audio-speakers-symbolic"
                    />
                </box>

                <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                    <label
                        label="Input"
                        halign={Gtk.Align.START}
                        cssClasses={["section-title"]}
                    />
                    <VolumeSlider
                        stream={microphone}
                        icon="audio-input-microphone-symbolic"
                    />
                </box>

                <box orientation={Gtk.Orientation.VERTICAL} spacing={8} vexpand>
                    <label
                        label="Applications"
                        halign={Gtk.Align.START}
                        cssClasses={["section-title"]}
                    />
                    <scrolledwindow heightRequest={200} propagateNaturalHeight>
                        <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
                            <For each={streams}>
                                {(stream) => (
                                    <box
                                        orientation={Gtk.Orientation.VERTICAL}
                                        spacing={4}
                                    >
                                        <label
                                            label={createBinding(
                                                stream,
                                                "description",
                                            )}
                                            halign={Gtk.Align.START}
                                            cssClasses={["app-name"]}
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
            </box>
        </window>
    );
}
