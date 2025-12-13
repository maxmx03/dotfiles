#!/bin/bash

export WAYLAND_DISPLAY=wayland-1
export XDG_RUNTIME_DIR=/run/user/1000
declare wallpapers wallpaper total_wallpapers random_index

wallpapers=($HOME/.wallpapers/*)
total_wallpapers=${#wallpapers[@]}
random_index=$((RANDOM % "$total_wallpapers"))
wallpaper=${wallpapers["$random_index"]}

swww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
