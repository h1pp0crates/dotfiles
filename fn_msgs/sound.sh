#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
    notify-send "Argument error" "Usage: up|down|mute" -h string:synchronous:"volume-notify" -t 2000 -r 7777
    exit
fi

act="$1"
path_to_icons="$(dirname "$(realpath "$0")")/icons"
bgcolor=string:bgcolor:#222222
fgcolor=string:fgcolor:#bbbbbb
frcolor=string:frcolor:#0077cc

if [[ ! -d $path_to_icons ]]; then
    notify-send "Icons path doesn't exist" "Set correct path in variable \"path_to_icons\"" -h string:synchronous:"volume-notify" -t 2000 -r 7777
    exit
fi

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | head -1 | awk -F '/' '{print $2}' | awk -F '%' '{print $1}'
}

is_mute() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes
}

send_message() {
    bar=$(seq -s "─" $(($volume / 5 + 1)) | sed 's/[0-9]//g')
    notify-send -i "$icon" "${volume}%" "$bar" -h string:synchronous:"volume-notify" -h "$bgcolor" -h "$fgcolor" -h "$frcolor" -t 2000 -r 7777
}

type_message() {
    volume="$(get_volume)"
    if [[ $act = up ]]; then
        icon="$path_to_icons/volume_up.svg"
        send_message
    fi
    if [[ $act = down ]]; then
        if (($volume > 0)); then
            icon="$path_to_icons/volume_down.svg"
        else
            icon="$path_to_icons/volume_mute.svg"
        fi
        send_message
    fi
    if [[ $act = mute ]]; then
        if is_mute; then
            icon="$path_to_icons/volume_mute.svg"
        else
            icon="$path_to_icons/volume_up.svg"
        fi
        send_message
    fi
}

case $act in
up)
    volume="$(get_volume)"
    if is_mute; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    fi
    if (($volume <= 95)); then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        type_message
    elif (($volume < 100)); then
        pactl set-sink-volume @DEFAULT_SINK@ 100%
        type_message
    else
        type_message
    fi
    ;;
down)
    if is_mute; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    fi
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    type_message
    ;;
mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    type_message
    ;;
esac
