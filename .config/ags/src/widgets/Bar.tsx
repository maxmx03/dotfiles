import app from "ags/gtk4/app";
import { Astal, Gdk, Gtk } from "ags/gtk4";
import { execAsync } from "ags/process";
import { createPoll } from "ags/time";
import { createBinding } from "ags";
import Workspaces from "./Workspaces";
import GLib from "gi://GLib?version=2.0";
import SysTray from "./SysTray";
import Wp from "gi://AstalWp?version=0.1";

import { showQSPage } from "./QuickSettings";

const DateTime = () => {
  const time = createPoll(
    "",
    1000,
    () => GLib.DateTime.new_now_local().format("%a %H:%M")!,
  );

  return (
    <button
      class="datetime"
      onClicked={() => app.toggle_window("calendar")}
    >
      <label label={time} />
    </button>
  );
};

const VolumeTrigger = () => {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;
  const volume = createBinding(speaker, "volume");

  const icon = createBinding(speaker, "volume").as((v: number) => {
    if (speaker.mute) return "audio-volume-muted-symbolic";
    if (v === 0) return "audio-volume-muted-symbolic";
    if (v < 0.33) return "audio-volume-low-symbolic";
    if (v < 0.66) return "audio-volume-medium-symbolic";
    return "audio-volume-high-symbolic";
  });

  return (
    <button
      class="volume-control"
      onClicked={() => showQSPage("main")}
    >
      <box spacing={4}>
        <image iconName={icon} />
        <label label={volume((v: number) => `${Math.floor(v * 100)}%`)} />
      </box>
    </button>
  );
};

const WallpaperTrigger = () => {
  return (
    <button
      class="wallpaper-control"
      onClicked={() => showQSPage("wallpaper")}
    >
      <image iconName="preferences-desktop-wallpaper-symbolic" />
    </button>
  );
};

const SideMenu = () => {
  return (
    <box class="sidemenu" halign={Gtk.Align.END}>
      <button
        class="launcher-trigger"
        onClicked={() => app.toggle_window("launcher")}
      >
        <image iconName="system-search-symbolic" />
      </button>
      <button
        class="window-switcher-trigger"
        onClicked={() => app.toggle_window("window-switcher")}
      >
        <image iconName="view-grid-symbolic" />
      </button>
      <SysTray />
      <WallpaperTrigger />
      <VolumeTrigger />
      <button
        cssClasses={["power-menu-trigger"]}
        onClicked={() => app.toggle_window("powermenu")}
      >
        <image iconName="system-shutdown-symbolic" />
      </button>
    </box>
  );
};

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <box class="bar-container">
        <box class="left-section" hexpand halign={Gtk.Align.START}>
          <button
            class="arch-logo"
            onClicked={() => execAsync("alacritty").catch(console.error)}
          >
            <image
              file="/home/milianor/.config/ags/src/assets/icons/archlinux.svg"
              pixelSize={20}
            />
          </button>
          <Workspaces gdkmonitor={gdkmonitor} />
        </box>

        <box class="center-section" hexpand halign={Gtk.Align.CENTER}>
          <DateTime />
        </box>

        <box class="right-section" hexpand halign={Gtk.Align.END}>
          <SideMenu />
        </box>
      </box>
    </window>
  );
}
