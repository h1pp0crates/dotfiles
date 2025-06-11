#!/bin/bash

selected=$(printf "Exit\nWi-Fi manager\nBluetooth manager" | rofi -dmenu -theme /usr/share/rofi/themes/fullscreen-preview.rasi)

if [[ "$selected" == "Wi-Fi manager" ]];then
    notify-send "Openning $selected..."
    /home/salamander/programming/bash/rofi_wifi.sh
elif [[ "$selected" == "Bluetooth manager" ]]; then
    notify-send "Openning $selected..."
    /home/salamander/programming/bash/rofi_bluetooth.sh
elif [[ "$selected" == "Exit" ]]; then
    exit
else
    notify-send "Wrong option: $selected"
fi

