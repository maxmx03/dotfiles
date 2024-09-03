#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
declare wallpapers wallpaper total_wallpapers random_index

wallpapers=($HOME/Wallpapers/*)
total_wallpapers=${#wallpapers[@]}
random_index=$((RANDOM % "$total_wallpapers"))
wallpaper=${wallpapers["$random_index"]}

swww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
