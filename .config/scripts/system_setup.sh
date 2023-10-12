#!/bin/env bash

# Add necessary repos
if [[ $(lspci | rg VGA) == *"NVIDIA"* ]]; then
  zypper -n addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
fi
zypper -n addrepo https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed/shells.repo

# Install Packages
zypper -n install gcc-c++ git kitty gitui starship ripgrep helix polybar bottom flatpak spotify-easyrpm npm nushell

flatpak install -y --noninteractive flathub com.logseq.Logseq

spotify-easyrpm --quiet

# Install language servers
npm i -g bash-language-server vscode-langservers-extracted
pip install ruff-lsp --break-system-packages

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
