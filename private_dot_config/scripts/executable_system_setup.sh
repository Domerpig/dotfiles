#!/bin/bash

sudo dnf update
sudo dnf copr enable yalter/niri

# Install Packages
sudo dnf install fuzzel go git gcc zoxide niri neovim flatpak

# uninstall unused packages
sudo dnf remove alacritty

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
    echo "test"
elif [[ "$host" == "PC" ]]; then
    echo "hi"
fi

