#!/usr/bin/env bash

wallpaper_dir="$(xdg-user-dir PICTURES)/wallpapers"
wallpapers=("$wallpaper_dir"/*)
total_wallpapers=${#wallpapers[@]}
random_index=$((RANDOM % "$total_wallpapers"))
wallpaper=${wallpapers["$random_index"]}
bg_info=$(awww query)
current_wallpaper="${bg_info##*:}"
awww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
