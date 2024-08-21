#!/bin/bash

xbps-install "$@"

echo "Update Waybar"
pkill -SIGRTMIN+4 waybar
