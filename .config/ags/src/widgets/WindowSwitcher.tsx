import { Astal, Gdk, Gtk } from "ags/gtk4"
import AstalHyprland from "gi://AstalHyprland?version=0.1"
import { createBinding, createComputed, For, createState } from "ags"
import type { Accessor } from "ags"
import app from "ags/gtk4/app"

const hyprland = AstalHyprland.get_default()

function ClientButton({
  client,
  selected,
  onClick,
}: {
  client: AstalHyprland.Client
  selected: Accessor<boolean>
  onClick: () => void
}) {
  const cssClasses = createComputed(() =>
    selected() ? ["client-button", "selected"] : ["client-button"]
  )

  return (
    <button
      onClicked={onClick}
      focusable
      cssClasses={cssClasses}
    >
      <box spacing={12}>
        <image
          iconName={client.class || "window-new-symbolic"}
          pixelSize={32}
          cssClasses={["client-icon"]}
        />
        <box orientation={Gtk.Orientation.VERTICAL} halign={Gtk.Align.START}>
          <label
            label={client.title || "Sem título"}
            halign={Gtk.Align.START}
            cssClasses={["client-title"]}
            wrap={true}
            maxWidthChars={30}
          />
        </box>
      </box>
    </button>
  )
}

export default function WindowSwitcher(gdkmonitor: Gdk.Monitor) {
  const [selectedIndex, setSelectedIndex] = createState(0)

  // Get all Hyprland clients (filter out special windows)
  const clients = createBinding(hyprland, "clients").as((clientList) => {
    const filtered = clientList.filter(
      (client) =>
        client.get_title() &&
        client.get_class() &&
        client.get_class() !== "ags" &&
        client.get_class() !== "gjs" &&
        client.get_class() !== "gnome-shell"
    )
    console.log("Filtered clients:", filtered.map(c => c.get_title()))
    return filtered
  })

  const focusClient = (client: AstalHyprland.Client) => {
    console.log("Focusing client:", client.get_title(), "index:", selectedIndex())
    client.focus()
    app.toggle_window("window-switcher")
  }

  // Reset selection when clients change
  clients.subscribe(() => {
    console.log("Clients changed, resetting selection to 0")
    setSelectedIndex(0)
  })

  return (
    <window
      name="window-switcher"
      anchor={Astal.WindowAnchor.NONE}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      keymode={Astal.Keymode.EXCLUSIVE}
      visible={false}
      application={app}
      layer={Astal.Layer.OVERLAY}
      widthRequest={480}
      heightRequest={320}
      marginTop={60}
      marginLeft={60}
      $={(self) => {
        // Add key event controller
        const keyController = new Gtk.EventControllerKey()
        keyController.connect("key-pressed", (_, keyval) => {
          const clientList = clients.get()

          switch (keyval) {
            case Gdk.KEY_Down:
            case Gdk.KEY_Tab:
              if (clientList.length > 0) {
                const newIndex = (selectedIndex() + 1) % clientList.length
                console.log("Down/Tab: old index", selectedIndex(), "new index", newIndex)
                setSelectedIndex(newIndex)
              }
              return true

            case Gdk.KEY_Up:
            case Gdk.KEY_ISO_Left_Tab:
              if (clientList.length > 0) {
                const newIndex = (selectedIndex() - 1 + clientList.length) % clientList.length
                console.log("Up/Shift+Tab: old index", selectedIndex(), "new index", newIndex)
                setSelectedIndex(newIndex)
              }
              return true

            case Gdk.KEY_Return:
            case Gdk.KEY_KP_Enter:
              if (
                clientList.length > 0 &&
                selectedIndex.get() < clientList.length
              ) {
                focusClient(clientList[selectedIndex.get()])
              }
              return true

            case Gdk.KEY_Escape:
              app.toggle_window("window-switcher")
              setSelectedIndex(0)
              return true

            default:
              return false
          }
        })

        self.add_controller(keyController)
      }}
    >
      <box
        orientation={Gtk.Orientation.VERTICAL}
        cssClasses={["window-switcher-container"]}
      >
        <box cssClasses={["switcher-header"]} spacing={8}>
          <label
            label="Janelas"
            cssClasses={["switcher-title"]}
            halign={Gtk.Align.CENTER}
            hexpand
          />
        </box>

        <Gtk.Separator />

        <scrolledwindow vexpand>
          <box
            orientation={Gtk.Orientation.VERTICAL}
            cssClasses={["client-list"]}
          >
            <For each={clients}>
              {(client, index) => (
                <ClientButton
                  client={client}
                  selected={selectedIndex((i) => i === index())}
                  onClick={() => focusClient(client)}
                />
              )}
            </For>
          </box>
        </scrolledwindow>
      </box>
    </window>
  )
}
