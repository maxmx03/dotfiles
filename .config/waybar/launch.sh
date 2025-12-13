#!/usr/bin/env bash

# Terminate already running bar instances
killall -q waybar

# Wait until amixer is ready
while [[ -z $(amixer scontrols) ]]; do
  sleep 1
done

# Wait until waybar is ready
while [[ -z $("$HOME"/.config/waybar/scripts/weather) ]]; do
  sleep 1
done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/waybar.log
waybar 2>&1 | tee -a /tmp/waybar.log &
disown

echo "Waybar launched"
