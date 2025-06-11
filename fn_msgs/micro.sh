#!/bin/bash

set -euo pipefail

path_to_icons="$(dirname "$(realpath "$0")")/icons"
bgcolor=string:bgcolor:#222222
fgcolor=string:fgcolor:#bbbbbb
frcolor=string:frcolor:#0077cc

# Mute\unmute
pactl set-source-mute @DEFAULT_SOURCE@ toggle

# Send message
if pactl get-source-mute @DEFAULT_SOURCE@ | grep yes >/dev/null; then
    icon="$path_to_icons/mic_off.svg"
    notify-send -i "$icon" "Muted" -h "$bgcolor" -h "$fgcolor" -h "$frcolor" -t 2000 -r 7777
else
    icon="$path_to_icons/mic_on.svg"
    notify-send -i "$icon" "Unmuted" -h "$bgcolor" -h "$fgcolor" -h "$frcolor" -t 2000 -r 7777
fi
