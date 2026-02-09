#!/usr/bin/env bash

function change_bg() {
	wallpapers=($HOME/Pictures/wallpapers/*)
	total_wallpapers=${#wallpapers[@]}
	random_index=$((RANDOM % "$total_wallpapers"))
	wallpaper=${wallpapers["$random_index"]}
	bg_info=$(awww query)
	current_wallpaper="${bg_info##*:}"
	awww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
}

change_bg
