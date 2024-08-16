#!/bin/bash

xbps-install -Syu

# Add necessary repos
if [[ $(lspci | grep VGA) == *"NVIDIA"* ]]; then
    xbps-install -y void-repo-nonfree void-repo-multilib
    xbps-install -Sy
    xbps-install linux-headers nvidia
else
    xbps-install linux-firmware-amd vulkan-loader mesa-vulkan-radeon amdvlk mesa-dri
fi

# Install Packages
xbps-install -y gcc gdb curl seatd starship ripgrep neovim fish-shell waybar wmenu foot lswlt      \
    kanshi noto-fonts-ttf river fzf zoxide git unzip elogind polkit dunst tokei wl-clipboard       \
    firefox dumb_runtime_dir dumb_runtime_dir dbus nextcloud-client zellij bottom

usermod -aG _seatd dominik

# # Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
