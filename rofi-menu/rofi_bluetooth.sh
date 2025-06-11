#!/bin/bash

set -uo pipefail

paired_or_trusted() {
    bluetoothctl devices | grep "^Device" | while read -r _ mac name; do
        if bluetoothctl info $mac | xargs | grep -Eq "Paired: yes|Trusted: yes"; then
            echo "$mac $name"
        fi
    done
}

power_on() {
    notify-send "$(bluetoothctl power on | grep "Changing")"
}

power_off() {
    notify-send "$(bluetoothctl power off | grep "Changing")"
}

scan_and_pair() {
    notify-send "Please, wait 7 seconds, scanning..."
    bluetoothctl --timeout 7 scan on
    devices=$(bluetoothctl devices | grep -vxFf <(paired_or_trusted))
    selected=$(printf "$devices" | cut -d ' ' -f 3- | grep -v "^$" | awk '{print $0} END {print "Back"}' | rofi -dmenu -p "Select name or type MAC for pair:")
    if [[ "$selected" =~ ^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$ ]]; then
        notify-send "Try to pair with $selected MAC"
        if bluetoothctl pair "$selected" | grep -q "Pairing successful"; then
            notify-send "Pairing successful"
        else
            notify-send "Fail to pair"
        fi
    elif [[ "$selected" == Back ]]; then
        return
    else
        mac_dev=$(echo "$devices" | grep -w "$selected" | head -1 | awk '{print $2}')
        notify-send "Try to pair with $selected"
        if bluetoothctl pair "$mac_dev" | grep -q "Pairing successful"; then
            notify-send "Pairing successful"
        else
            notify-send "Fail to pair"
        fi
    fi
}

trust() {
    devices=$(bluetoothctl devices)
    selected=$(echo "$devices" | cut -d ' ' -f 3- | grep -v "^$" | awk '{print $0} END {print "Back"}' | rofi -dmenu -p "Select name or type MAC for trust:")
    if [[ "$selected" == "Back" ]]; then
        return
    else
        mac_dev=$(echo "$devices" | grep -w "$selected" | head -1 | awk '{print $2}')
        if bluetoothctl trust "$mac_dev" | grep -q "trust succeeded"; then
            notify-send "trust succeeded"
        else
            notify-send "Fail to trust"
        fi
    fi
}

connect() {
    devices=$(bluetoothctl devices)
    selected=$(echo "$devices" | cut -d ' ' -f 3- | grep -v "^$" | awk '{print $0} END {print "Back"}' | rofi -dmenu -p "Device name:")
    if [[ "$selected" == "Back" ]]; then
        return
    else
        device_mac=$(echo "$devices" | grep -w "$selected" | awk '{print $2}')
        if bluetoothctl connect "$device_mac" | grep -q "Connection successful"; then
            notify-send "Connection successful"
        else
            notify-send "Failed to connect"
        fi
    fi
}

disconnect() {
    con_device_mac=$(bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done | grep -Po "(?<=Device )[a-fA-F0-9:]{17}" | head -1)
    if bluetoothctl disconnect "$con_device_mac" | grep -q "Disconnection successful"; then
        notify-send "Disconnection successful"
    else
        notify-send "Failed to disconnect"
    fi
}

remove() {
    device=$(paired_or_trusted | cut -d ' ' -f 2- | grep -v "^$" | awk '{print $0} END {print "Back"}' | rofi -dmenu -p "Device name:")
    if [[ "$device" == "Back" ]]; then
        return
    else
        device_mac=$(paired_or_trusted | grep -w "$device" | awk '{print $1}')
        if bluetoothctl remove "$device_mac" | grep -q "Device has been removed"; then
            notify-send "Device has been removed"
        else
            notify-send "Failed to remove device"
        fi
    fi
}

while true; do
    power="$(bluetoothctl show | grep -oP '(?<=Powered:)\s*yes' | xargs)"
    if [[ "$power" == "yes" ]]; then
        selected=$(printf "Exit\nPower off\nScan and pair\nTrust\nConnect\nDisconnect\nRemove device" | rofi -dmenu -p "Bluetooth manager:")

        case "$selected" in
        "Exit") exit ;;
        "Power off") power_off ;;
        "Scan and pair") scan_and_pair ;;
        "Trust") trust ;;
        "Connect") connect ;;
        "Disconnect") disconnect ;;
        "Remove device") remove ;;
        *)
            notify-send "$selected"
            exit
            ;;
        esac
    else
        selected=$(printf "Exit\nPower on" | rofi -dmenu -p "Bluetooth manager:")
        case "$selected" in
        "Exit") exit ;;
        "Power on") power_on ;;
        esac
    fi
done
