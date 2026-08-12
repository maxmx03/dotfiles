# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty"* ]]; then
	export XDG_SESSION_TYPE=x11
	export XDG_CURRENT_DESKTOP=i3
	export XDG_SESSION_DESKTOP=i3
	export GTK_THEME=BottleGlass:dark
	startx
fi
