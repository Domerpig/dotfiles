#!/bin/env bash

# Add necessary repos
if [[ $(lspci | grep VGA) == *"NVIDIA"* ]]; then
    xbps-install -y void-repo-nonfree void-repo-multilib
fi

xbps-install -Syu
# Install Packages
xbps-install -y gcc gdb curl linux-headers nvidia seatd starship ripgrep neovim fish-shell waybar  \
    wmenu foot lswlt kanshi noto-fonts-ttf river fzf zoxide git unzip elogind polkit dunst tokei   \
    wl-clipboard firefox dumb_runtime_dir dumb_runtime_dir dbus nextcloud-client

usermod -aG _seatd dominik

# # Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
