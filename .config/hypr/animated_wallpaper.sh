#!/usr/bin/env bash

killall -q mpvpaper

if [[ -d "$HOME/Vídeos/final fantasy" ]]; then
	mpvpaper -o "panscan=1.0 --loop-playlist shuffle volume=50" HDMI-A-1 '~/Vídeos/final fantasy' &
else
	mpvpaper -o "panscan=1.0 loop volume=50" HDMI-A-1 'https://youtu.be/2wLLHCL9p9A?si=IIQ-rRqyvWw9Neuu' &
fi

disown
