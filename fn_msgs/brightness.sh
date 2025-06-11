#!/bin/bash

set -euo pipefail

ICON="$(dirname "$(realpath "$0")")/icons/light.svg"
bgcolor=string:bgcolor:#222222
fgcolor=string:fgcolor:#bbbbbb
frcolor=string:frcolor:#0077cc

set_brightness() {
    brightness="$(brightnessctl | awk '{print $4}' | grep -Eo "[0-9]{1,3}")"
    notify-send -i "$ICON" "${brightness}%" -h int:value:"$brightness" -h string:synchronous:"brightness_volue" -h "$bgcolor" -h "$fgcolor" -h "$frcolor" -t 2000 -r 7777
}

case $1 in
up)
    brightnessctl -q set +5%
    set_brightness
    ;;
down)
    brightnessctl -q set 5%-
    set_brightness
    ;;
esac
