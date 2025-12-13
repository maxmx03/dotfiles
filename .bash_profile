export GTK_THEME="WhiteSur-Dark"
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty"* ]]; then
  Hyprland
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
