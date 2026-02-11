import AstalHyprland from "gi://AstalHyprland?version=0.1";
import { Accessor, createBinding } from "ags";

const hyprland = AstalHyprland.get_default();

const focusedWorkspaceBinding = hyprland
    ? createBinding(hyprland, "focusedWorkspace")
    : ({ get: () => null, subscribe: () => () => {} } as any);

export const compositor = {
    isHyprland() {
        return !!hyprland;
    },

    monitorWorkspaces(gdkmonitor: Gdk.Monitor): Accessor<any[]> {
        if (hyprland) {
            const model = gdkmonitor.model;
            return createBinding(hyprland, "workspaces").as((workspaces) =>
                workspaces
                    .filter((ws) => ws.monitor?.model === model)
                    .sort((a, b) => a.id - b.id)
            );
        }
        return { get: () => [], subscribe: () => () => {} } as any;
    },

    focusedWorkspace(): Accessor<any> {
        return focusedWorkspaceBinding;
    },

    workspaceId(ws: any): number {
        return ws?.id || 0;
    },

    workspaceName(ws: any): string {
        return ws?.name || "";
    },

    workspaceWindows(ws: any): Accessor<any[]> {
        if (hyprland && ws) {
            return createBinding(ws, "clients");
        }
        return { get: () => [], subscribe: () => () => {} } as any;
    },

    focusWorkspace(ws: any) {
        ws?.focus();
    },
};
