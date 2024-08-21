#!/bin/bash

declare -a options=(
    "Shutdown"
    "Restart"
    "Logout"
)

choice=$(printf '%s\n' "${options[@]}" | wmenu -i)

case $choice in
    "Shutdown")
        loginctl poweroff
        ;;
    "Restart")
        loginctl reboot
        ;;
    "Logout")
        riverctl exit
esac
