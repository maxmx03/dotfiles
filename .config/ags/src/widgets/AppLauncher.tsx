import { Astal, Gdk, Gtk } from "ags/gtk4"
import Apps from "gi://AstalApps?version=0.1"
import { createState, For } from "ags"
import app from "ags/gtk4/app"

function AppButton({ application }: { application: Apps.Application }) {
  return (
    <button
      class="app-button"
      onClicked={() => {
        application.launch()
        app.toggle_window("launcher")
      }}
    >
      <box spacing={8}>
        <image iconName={application.iconName} pixelSize={32} />
        <label label={application.name} halign={Gtk.Align.START} />
      </box>
    </button>
  )
}

export default function AppLauncher(gdkmonitor: Gdk.Monitor) {
  const apps = new Apps.Apps()
  const [text, setText] = createState("")
  const list = text((t) => apps.fuzzy_query(t))

  return (
    <window
      name="launcher"
      anchor={Astal.WindowAnchor.NONE}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      keymode={Astal.Keymode.ON_DEMAND}
      visible={false}
      application={app}
      layer={Astal.Layer.OVERLAY}
      marginTop={12}
    >
      <Gtk.EventControllerKey
        onKeyPressed={(/* { widget } */ _, keyval: number) => {
          if (keyval === Gdk.KEY_Escape) {
            // widget.hide()
            app.toggle_window("launcher")
          }
        }}
      />
      <box
        orientation={Gtk.Orientation.VERTICAL}
        class="launcher-container"
        widthRequest={800}
        heightRequest={500}
      >
        <entry
          placeholderText="Search apps..."
          onNotifyText={(self) => setText(self.text)}
          onActivate={() => {
            const items = list.get()
            if (items.length > 0) {
              items[0].launch()
              app.toggle_window("launcher")
            }
          }}
          $={(self) => {
            // Focus entry when window is shown
            app.connect("window-toggled", (_, win) => {
              if (win.name === "launcher" && win.visible) {
                self.grab_focus()
              }
            })
          }}
        />
        <scrolledwindow vexpand>
          <box orientation={Gtk.Orientation.VERTICAL} class="app-list">
            <For each={list}>
              {(application) => <AppButton application={application} />}
            </For>
          </box>
        </scrolledwindow>
      </box>
    </window>
  )
}
