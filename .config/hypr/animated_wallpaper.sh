#!/usr/bin/env bash

killall -q mpvpaper
mpvpaper -o "panscan=1.0 --loop --no-resume-playback shuffle=yes volume=80" HDMI-A-1 "$1" &
disown
