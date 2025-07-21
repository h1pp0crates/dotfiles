#!/bin/bash

selected=$(printf "Exit\nVideos toggle\nWi-Fi manager\nBluetooth manager" | rofi -dmenu -theme /usr/share/rofi/themes/fullscreen-preview.rasi)

if [[ "$selected" == "Videos toggle" ]]; then
    if ! systemctl --user is-active --quiet videos; then
        systemctl --user start videos
        notify-send "Opening video service on port 8080..."
    else 
        systemctl --user stop videos
        notify-send "Closing video service on port 8080..."
    fi
elif [[ "$selected" == "Wi-Fi manager" ]];then
    notify-send "Opening $selected..."
    $HOME/MyGitRepositories/dotfiles/rofi-menu/rofi_wifi.sh
elif [[ "$selected" == "Bluetooth manager" ]]; then
    notify-send "Opening $selected..."
    $HOME/MyGitRepositories/dotfiles/rofi-menu/rofi_bluetooth.sh
elif [[ "$selected" == "Exit" ]]; then
    exit
else
    notify-send "Wrong option: $selected"
fi

