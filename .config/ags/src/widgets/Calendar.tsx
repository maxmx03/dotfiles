import app from "ags/gtk4/app"
import { Astal, Gdk, Gtk } from "ags/gtk4"
import GLib from "gi://GLib?version=2.0"
import Pango from "gi://Pango?version=1.0"
import { createPoll } from "ags/time"
import { createBinding, createEffect, For } from "ags"
import { time } from "@/services/time"
import AstalNotifd from "gi://AstalNotifd?version=0.1"

const notifd = AstalNotifd.get_default()

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

function NotificationItem({ n }: { n: AstalNotifd.Notification }) {
  return (
    <box
      cssClasses={["notification-item"]}
      orientation={Gtk.Orientation.VERTICAL}
      spacing={4}
    >
      <box spacing={8} cssClasses={["notification-header"]}>
        <image
          iconName={n.app_icon || "preferences-system-notifications-symbolic"}
          pixelSize={16}
        />
        <label
          label={n.app_name || "Notification"}
          cssClasses={["notification-app-name"]}
          halign={Gtk.Align.START}
          hexpand
          ellipsize={Pango.EllipsizeMode.END}
        />
        <button
          iconName="window-close-symbolic"
          onClicked={() => n.dismiss()}
        />
      </box>
      <box orientation={Gtk.Orientation.VERTICAL} spacing={2}>
        <label
          label={n.summary}
          cssClasses={["notification-title"]}
          halign={Gtk.Align.START}
          xalign={0}
          ellipsize={Pango.EllipsizeMode.END}
        />
        {n.body ? (
          <label
            label={n.body}
            cssClasses={["notification-body"]}
            halign={Gtk.Align.START}
            xalign={0}
            wrap={true}
            maxWidthChars={30}
          />
        ) : null}
      </box>
    </box>
  )
}

function NotifsScrolledWindow() {
  const notifications = createBinding(notifd, "notifications")

  return (
    <Gtk.ScrolledWindow
      vexpand
      cssClasses={["scroll"]}
      hscrollbarPolicy={Gtk.PolicyType.NEVER}
    >
      <box orientation={Gtk.Orientation.VERTICAL} spacing={8}>
        <For each={notifications}>{(n) => <NotificationItem n={n} />}</For>
        <box
          halign={Gtk.Align.CENTER}
          valign={Gtk.Align.CENTER}
          cssClasses={["not-found"]}
          orientation={Gtk.Orientation.VERTICAL}
          vexpand
          spacing={12}
          marginTop={40}
          visible={notifications((n) => n.length === 0)}
        >
          <image iconName="notification-disabled-symbolic" pixelSize={64} />
          <label label="Your inbox is empty" cssClasses={["labelSmallBold"]} />
        </box>
      </box>
    </Gtk.ScrolledWindow>
  )
}

function DNDButton() {
  const dnd = createBinding(notifd, "dont_disturb")
  return (
    <box spacing={8} cssClasses={["dnd-box"]}>
      <label label="Do Not Disturb" cssClasses={["dnd-label"]} />
      <Gtk.Switch
        active={dnd}
        onStateSet={(self, state) => {
          notifd.dont_disturb = state
          return false // allow transition
        }}
        halign={Gtk.Align.END}
        valign={Gtk.Align.CENTER}
      />
    </box>
  )
}

function ClearButton() {
  const notifications = createBinding(notifd, "notifications")
  return (
    <button
      cssClasses={["clear-button"]}
      onClicked={() => notifd.notifications.forEach((n) => n.dismiss())}
      sensitive={notifications((n) => n.length > 0)}
    >
      <box spacing={6}>
        <image iconName="user-trash-full-symbolic" />
        <label label="Clear All" />
      </box>
    </button>
  )
}

export default function Calendar(gdkmonitor: Gdk.Monitor) {
  const { TOP } = Astal.WindowAnchor

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
    >
      <box cssClasses={["calendar-window-box"]}>
        <box
          cssClasses={["notifications-container"]}
          orientation={Gtk.Orientation.VERTICAL}
          widthRequest={400}
        >
          <box cssClasses={["window-header"]} spacing={8}>
            <label
              label="Notifications"
              hexpand
              halign={Gtk.Align.START}
              cssClasses={["header-title"]}
            />
            <ClearButton />
          </box>
          <Gtk.Separator />
          <NotifsScrolledWindow />
          <Gtk.Separator />
          <DNDButton />
        </box>

        <box
          cssClasses={["datemenu-container"]}
          orientation={Gtk.Orientation.VERTICAL}
          widthRequest={500}
        >
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
            <box halign={Gtk.Align.CENTER} spacing={4}>
              <label
                label="uptime:"
                cssClasses={["uptime-label"]}
                opacity={0.7}
              />
              <label
                label={uptime.as((seconds) => formatUptime(seconds))}
                cssClasses={["uptime-label"]}
              />
            </box>
            <box cssClasses={["calendar-box"]}>
              <Gtk.Calendar halign={Gtk.Align.CENTER} />
            </box>
          </box>
        </box>
      </box>
    </window>
  )
}
