#!/bin/bash

function pomodoro {
  declare -A pomo_options
  pomo_options["work"]="45"
  pomo_options["break"]="15"
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo "$val"
  cmus-remote -p
  timer ${pomo_options["$val"]}m
  cmus-remote -s
  notify-send -t 8000 "$val" "session done"
  fi
}
