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

# Install paru: Yay helper
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
(cd yay && makepkg -si)
rm -rf yay

# Install packages from AUR
yay -S --needed - < foreignpkglist.txt

# Make zsh the default shell
chsh -s /usr/bin/zsh

# Change default shell (#!/bin/sh) to dash
ln -sfT dash /usr/bin/sh

# Enable systemd services
services=("cronie" "warp-svc.service")
for service in "${services[@]}"; do  
  sudo systemctl enable --now "$service"
done

# Configure warp-cli (VPN)
warp-cli register
warp-cli connect
