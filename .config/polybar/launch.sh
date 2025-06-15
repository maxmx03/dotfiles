#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# wait until amixer is ready
while [[ -z $(amixer scontrols) ]]; do
  sleep 1
done

# wait until openmeteo is ready
while [[ -z $("$HOME"/.config/polybar/scripts/openmeteo) ]]; do
  sleep 1
done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar example 2>&1 | tee -a /tmp/polybar1.log &
disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log &
# disown

echo "Bars launched..."
