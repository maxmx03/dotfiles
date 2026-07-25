#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty"* ]]; then
	export XDG_SESSION_TYPE=wayland
	export XDG_CURRENT_DESKTOP=Hyprland
	export XDG_SESSION_DESKTOP=Hyprland
	export GDK_BACKEND=wayland
	export MOZ_ENABLE_WAYLAND=1
	export ADW_DISABLE_PORTAL=1
	export EDITOR=nvim
	dbus-run-session start-hyprland
fi
