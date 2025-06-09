#!/bin/bash

###############################################################################
################################## Packages ###################################
###############################################################################
sudo dnf -y update
sudo dnf -y copr enable yalter/niri lihaohong/yazi

sudo dnf install fuzzel go git gcc zoxide niri neovim flatpak yazi udiskie     \
    nextcloud

# Dependencies for swww
sudo dnf install wayland-devel wayland-protocols-devel lz4-devel

# uninstall unused packages
sudo dnf remove alacritty nano-default-editor

###############################################################################

# Install Flatpaks
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub one.flipperzero.qFlipper

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Pyenv
curl https://pyenv.run | bash

# Set git user
git config --global user.email "domerpig@proton.me"
git config --global user.name "Domerpig"

host="$(hostname)"

if [[ "$host" == "Framework" ]]; then
    ./executable_setup_notebook.sh
elif [[ "$host" == "PC" ]]; then
    ./executable_setup_tower.sh
fi

# Enable services
sudo systemctl enable power-profiles-daemon
sudo systemctl enable --user pipewire
sudo systemctl enable --user gnome-keyring-daemon
