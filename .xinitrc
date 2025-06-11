
greenclip daemon > /dev/null &
xset s off &
xset -dpms &
xidlehook --not-when-audio --not-when-fullscreen --timer 900 'systemctl suspend' '' &
systemctl --user import-environment DISPLAY &
systemctl --user start redshift &
exec dwm


