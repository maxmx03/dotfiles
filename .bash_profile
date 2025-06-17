if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty"* ]]; then
  startx
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
