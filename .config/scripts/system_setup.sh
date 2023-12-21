#!/bin/env bash

# Add necessary repos
if [[ $(lspci | rg VGA) == *"NVIDIA"* ]]; then
  zypper -n addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
fi
zypper -n addrepo https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed/shells.repo | echo 'a'

zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials
zypper dup --from packman-essentials --allow-vendor-change | echo 'a'

# Install Packages
zypper -n install gcc-c++ git kitty gitui starship ripgrep helix bottom spotify-easyrpm npm nushell lldb flatpak tokei waybar dunst

flatpak install -y --noninteractive flathub com.logseq.Logseq

# Install language servers
npm i -g bash-language-server vscode-langservers-extracted
pip install ruff-lsp --break-system-packages

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
