#!/bin/bash

declare -a options=(
    " Shutdown"
    " Reboot"
    " Logout"
)

choice=$(printf '%s\n' "${options[@]}" | fuzzel --dmenu)

case $choice in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Logout")
        systemctl exit
esac
