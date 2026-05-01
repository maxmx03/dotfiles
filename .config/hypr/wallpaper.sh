#!/usr/bin/env bash

wallpaper_dir="$(xdg-user-dir PICTURES)/wallpapers"

[[ -d "$wallpaper_dir" ]] || exit 1

wallpapers=("$wallpaper_dir"/*)
total_wallpapers=${#wallpapers[@]}

[[ "$total_wallpapers" -eq 0 ]] && exit 1

random_index=$((RANDOM % total_wallpapers))
wallpaper="${wallpapers[$random_index]}"

bg_info=$(awww query 2>/dev/null) || exit 1
current_wallpaper=$(basename "${bg_info##*:}")

if [[ "$(basename "$wallpaper")" != "$current_wallpaper" ]]; then
	awww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
fi
