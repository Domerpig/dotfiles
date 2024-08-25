#!/bin/bash

xbps-install -Su

echo "Update Waybar"
pkill -SIGRTMIN+4 waybar
