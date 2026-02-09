import { Gdk, Gtk } from "ags/gtk4"
import { For } from "ags"
import { compositor } from "@/lib/compositor"

const ICONS = {
  1: "", // Terminal
  2: "", // Browser
  3: "", // Nautilus
  4: "", // Steam
  5: "󰨞", // VSCode
} as Record<number, string>

function WorkspaceButton({ ws }: { ws: any }) {
  const focusedWorkspace = compositor.focusedWorkspace()
  const windowCount = compositor.workspaceWindows(ws)((w) => w.length)
  const id = compositor.workspaceId(ws)

  const classNames = focusedWorkspace((fws) => {
    const classes = ["workspace"]
    if (fws && compositor.workspaceId(fws) === id) {
      classes.push("active")
    }
    if (windowCount() > 0) {
      classes.push("occupied")
    } else {
      classes.push("empty")
    }
    return classes.join(" ")
  })

  return (
    <button class={classNames} onClicked={() => compositor.focusWorkspace(ws)}>
      <label label={ICONS[id] || id.toString()} />
    </button>
  )
}

export default function Workspaces({
  gdkmonitor,
}: {
  gdkmonitor: Gdk.Monitor
}) {
  const workspaces = compositor.monitorWorkspaces(gdkmonitor)

  return (
    <box class="workspaces" halign={Gtk.Align.START}>
      <For each={workspaces}>{(ws) => <WorkspaceButton ws={ws} />}</For>
    </box>
  )
}
