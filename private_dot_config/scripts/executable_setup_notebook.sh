#!/bin/bash

# Install notebook specific apps
sudo dnf install power-profiles-daemon

# Install dependencies for cargo apps
sudo dnf install -y dbus-devel openssl-devel libsixel

# Install cargo apps
$HOME/.cargo/bin/cargo install spotify_player --no-default-features --features notify,pulseaudio-backend,sixel,fzf,daemon,streaming,media-control

# Install SDDM theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
