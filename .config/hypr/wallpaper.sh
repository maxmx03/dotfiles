#!/usr/bin/env bash

function change_bg() {
	wallpapers=($HOME/Imagens/wallpapers/*)
	total_wallpapers=${#wallpapers[@]}
	random_index=$((RANDOM % "$total_wallpapers"))
	wallpaper=${wallpapers["$random_index"]}

	bg_info=$(awww query)
	current_wallpaper="${bg_info##*:}"

	if [[ "$(basename $current_wallpaper)" = "$(basename $wallpaper)" ]]; then
		change_bg
	else
		awww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
	fi
}

change_bg
