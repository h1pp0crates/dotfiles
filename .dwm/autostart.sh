#!/bin/bash

nitrogen --restore; sleep 1; picom -b
setxkbmap -model pc104 -layout us,ua -option grp:rctrl_toggle
xinput set-prop "SYNA2BA6:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "SYNA2BA6:00 06CB:CE2D Touchpad" "libinput Natural Scrolling Enabled" 1
/usr/bin/lxqt-policykit-agent &
dwmblocks

