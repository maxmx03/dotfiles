import app from "ags/gtk4/app"
import { Astal, Gtk } from "ags/gtk4"
import GLib from "gi://GLib?version=2.0"
import { createPoll } from "ags/time"
import { time } from "@/services/time"
import AstalNotifd from "gi://AstalNotifd?version=0.1"

// Formatação de uptime
function formatUptime(seconds: number): string {
  const days = Math.floor(seconds / 86400)
  const hours = Math.floor((seconds % 86400) / 3600)
  const minutes = Math.floor((seconds % 3600) / 60)

  let result = ""
  if (days > 0) result += `${days}d `
  if (hours > 0 || days > 0) result += `${hours}h `
  result += `${minutes}m`

  return result
}

const uptime = createPoll(
  Math.floor(GLib.get_monotonic_time() / 1000000),
  60000,
  () => Math.floor(GLib.get_monotonic_time() / 1000000),
)

const notifd = AstalNotifd.get_default()

function NotifsScrolledWindow() {
  return (
    <Gtk.ScrolledWindow vexpand cssClasses={["scroll"]}>
      <box
        orientation={Gtk.Orientation.VERTICAL}
        hexpand={false}
        vexpand={false}
        spacing={8}
      >
        {notifd.notifications.map((e) => (
          <revealer
            revealChild={true}
            transitionDuration={300}
            transitionType={Gtk.RevealerTransitionType.CROSSFADE}
          >
            <box
              cssClasses={["notification-item"]}
              orientation={Gtk.Orientation.VERTICAL}
              spacing={4}
            >
              <label
                label={e.summary}
                cssClasses={["notification-title"]}
                halign={Gtk.Align.START}
              />
              {e.body ? (
                <label
                  label={e.body}
                  cssClasses={["notification-body"]}
                  halign={Gtk.Align.START}
                  wrap={true}
                />
              ) : null}
            </box>
          </revealer>
        ))}
        <box
          halign={Gtk.Align.CENTER}
          valign={Gtk.Align.CENTER}
          cssClasses={["not-found"]}
          orientation={Gtk.Orientation.VERTICAL}
          vexpand
          spacing={6}
          visible={notifd.notifications.length === 0}
        >
          <image iconName="notification-disabled-symbolic" pixelSize={50} />
          <label label="Your inbox is empty" cssClasses={["labelSmallBold"]} />
        </box>
      </box>
    </Gtk.ScrolledWindow>
  )
}

function DNDButton() {
  return (
    <box spacing={6}>
      <label label={"Do Not Disturb"} />
      <Gtk.Switch
        heightRequest={10}
        active={notifd.dont_disturb}
        onStateSet={(self, state) => {
          self.set_state(state)
          notifd.set_dont_disturb(state)
        }}
        halign={Gtk.Align.CENTER}
      />
    </box>
  )
}

function ClearButton() {
  return (
    <button
      cssClasses={["clear"]}
      halign={Gtk.Align.CENTER}
      onClicked={() => {
        notifd.notifications.forEach((n) => n.dismiss())
        app.toggle_window("calendar")
      }}
      sensitive={notifd.notifications.length > 0}
    >
      <box spacing={6}>
        <label label={"Clear"} />
        <image iconName={"user-trash-full-symbolic"} />
      </box>
    </button>
  )
}

export default function Calendar(gdkmonitor: Gdk.Monitor) {
  const { TOP, RIGHT } = Astal.WindowAnchor

  return (
    <window
      name="calendar"
      anchor={TOP}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      keymode={Astal.Keymode.ON_DEMAND}
      visible={false}
      application={app}
      layer={Astal.Layer.OVERLAY}
      marginTop={60}
      marginRight={12}
    >
      <box spacing={0}>
        <box
          cssClasses={["notifications-container"]}
          orientation={Gtk.Orientation.VERTICAL}
          vexpand={false}
        >
          <Gtk.Separator />
          <NotifsScrolledWindow />
          <box cssClasses={["window-header"]}>
            <DNDButton />
            <box hexpand />
            <ClearButton />
          </box>
        </box>

        <box cssClasses={["datemenu-container"]}>
          <box
            hexpand
            orientation={Gtk.Orientation.VERTICAL}
            halign={Gtk.Align.CENTER}
            cssClasses={["dash-main"]}
          >
            <label
              label={time((t: GLib.DateTime) => t.format("%H:%M")!)}
              halign={Gtk.Align.CENTER}
              cssClasses={["time-label"]}
            />
            <box halign={Gtk.Align.CENTER}>
              <label
                label={"uptime: "}
                cssClasses={["uptime-label"]}
                xalign={0}
              />
              <label
                label={uptime.as((seconds) => formatUptime(seconds))}
                halign={Gtk.Align.CENTER}
                cssClasses={["uptime-label"]}
              />
            </box>
            <Gtk.Calendar halign={Gtk.Align.CENTER} />
          </box>
        </box>
      </box>
    </window>
  )
}

