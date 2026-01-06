#!/bin/bash

volume_step=1
max_volume=100

function get_volume {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Po '[0-9].[0-9]{2}' | awk '{print $1*100}'
}

function get_mute {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED" && echo "yes" || echo "no"
}

function get_volume_icon {
	volume=$(get_volume)
	mute=$(get_mute)
	if [ "$mute" == "yes" ] || [ "$volume" -eq 0 ]; then
		volume_icon=""
	elif [ "$volume" -lt 50 ]; then
		volume_icon=""
	else
		volume_icon=""
	fi
}

function show_volume_notif {
	volume=$(get_volume)
	get_volume_icon
	notify-send -e -h string:x-canonical-private-synchronous:volume \
		-h int:value:$volume -t 1000 "Volume" "$volume_icon $volume%"
}

case $1 in
up)
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
	wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ $volume_step%+
	show_volume_notif
	;;
down)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step%-
	show_volume_notif
	;;
mute)
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	show_volume_notif
	;;
esac
