#!/bin/bash

function _timer {
  declare -i t percentage
  local message
  t=$(($1 * 60))
  message=$2
  for ((i = 1; i <= t; i++)); do
    percentage=$((i * 100 / t))
    bar_length=$((percentage / 2))
    printf "\r$message $((t - i))s [%-${bar_length}s] %d%%" "$(seq -s "#" "$bar_length" | tr -d '[:digit:]')" "$percentage"
    sleep 1s
  done

  echo -e "\nDone!"
}

function pomodoro {
  local state=$1
  local sound=/usr/share/sounds/freedesktop/stereo/complete.oga

  for ((session = 1; ; session++)); do
    case $state in
    work)
      _timer "25" "work"
      echo "pw-cat -p $sound" | at now
      notify-send -t 8000 "work" "session done"
      ;;
    break)
      _timer "5" "break"
      notify-send -t 8000 "break" "session done"
      echo "pw-cat -p $sound" | at now
      ;;
    extrabreak)
      _timer "10" "extra break"
      notify-send -t 8000 "long break" "session done"
      echo "pw-cat -p $sound" | at now
      ;;
    *)
      echo "
        usage:
        pomodoro work
        pomodoro break
        "
      ;;
    esac

    case $((session % 4)) in
    0)
      state="extrabreak"
      ;;
    *)
      case $state in
      work)
        state="break"
        ;;
      break)
        state="work"
        ;;
      *)
        state="work"
        ;;
      esac
      ;;
    esac
    read -p "Continue to the next session? [y/N]: " confirm
    if [[ $confirm != [yY] ]]; then
      echo "Pomodoro finalized."
      break
    fi
    clear
  done
}
