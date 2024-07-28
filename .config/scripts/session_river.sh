#!/usr/bin/bash
# Needs to be executed on river startup, because other XDG_PORTAL is not working

export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_TYPE=wayland

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

