#!/usr/bin/env bash

# Update system
sudo pacman -Syu

# Clone dotfiles (bare git repository)
git clone --bare git@github.com:basilioss/dotfiles.git "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout

# Symlink root config files
sudo ~/.root/install.sh

# Install packages
# https://wiki.archlinux.org/title/pacman/Tips_and_tricks#List_of_installed_packages
sudo pacman -S --needed - < ~/.config/pkglist/pkglist.txt

# Install paru: AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
(cd paru && makepkg -si)
rm -rf paru

# Install packages from AUR
paru -S --needed - < foreignpkglist.txt

# If something is missing during dwm/dmenu compiling use "pacman -Fy" to 
# update the database and "pacman -F <file>" to search for package name

# Install dwm: Windows Manager
# git clone git@github.com:basilioss/dwm.git ~/.local/src/dwm
sudo make -C ~/.local/src/dwm install

# Install dmenu: Program menu
# git clone git@github.com:basilioss/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu install

# For VirtualBox
# systemctl enable vboxservice
# sudo usermod -a -G vboxsf $(whoami) # give access to shared folders

# Make zsh the default shell
chsh -s /usr/bin/zsh

# Change default shell (#!/bin/sh) to dash
ln -sfT dash /usr/bin/sh

# Enable systemd services
services=("cronie" "warp-svc.service" "auto-cpufreq")
for service in "${services[@]}"; do  
  sudo systemctl enable --now "$service"
done

# Block ads, fakenews, gambling and porn
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts > ~/hosts
sudo cp ~/hosts /etc/hosts
rm ~/hosts

# Configure warp-cli
warp-cli register
warp-cli connect

# Espanso: text expander
espanso service register
espanso_pkgs=("lorem" "misspell-en-us" "misspell-en" "contractions-en")
for pkg in "${espanso_pkgs[@]}" ; do espanso install "$pkg" ; done

# Set lock screen wallpaper
wallpaper=$WALLPAPERS/trail.jpeg
betterlockscreen -u "$wallpaper"

# Touch alternative with a sprinkle of mkdir written in rust
sudo curl -L https://github.com/elliot40404/bonk/releases/latest/download/bonk_linux_x64 -o /usr/local/bin/bonk
sudo chmod +x /usr/local/bin/bonk
