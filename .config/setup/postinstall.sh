#!/usr/bin/env bash
#
# Arch Linux post installation script.
# Not intended for public use.

# Update system
sudo pacman -Syu

# Clone dotfiles
git clone --bare git@github.com:basilioss/dotfiles.git "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout

# Install packages
sudo pacman -S --needed - < ~/.config/pkglist/pkglist.txt

# Paru: AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git ~/.local/src/paru
cd ~/.local/src/paru || exit
makepkg -si
rm -rf ~/.local/src/paru

# Install packages from AUR
paru -S --needed - < foreignpkglist.txt

# Generate hooks to keep the lists of installed pkgs up-to-date
# https://wiki.archlinux.org/title/pacman/Tips_and_tricks#List_of_installed_packages>
sudo cp ~/.config/pkglist/generate-pkglist.hook \
    ~/.config/pkglist/generate-foreignpkglist.hook /usr/share/libalpm/hooks

# Suckless dependencies
# If something else is missing during compiling use "pacman -Fy" to update the database
# and "pacman -F <file>" to search for package name
sudo pacman -S libxft libxinerama

# dwm: Windows Manager
git clone git@github.com:basilioss/dwm.git ~/.local/src/dwm
sudo make -C ~/.local/src/dwm install

# dmenu: Program menu
git clone git@github.com:basilioss/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu install

# st: Terminal
# git clone git@github.com:basilioss/st.git ~/.local/src/st
# sudo make -C ~/.local/src/st install

# slstatus: Status bar for dwm
# git clone git@github.com:basilioss/slstatus.git ~/.local/src/slstatus
# sudo make -C ~/.local/src/slstatus install

# tabbed: tabs for st
# git clone git@github.com:basilioss/tabbed.git ~/.local/src/tabbed
# sudo make -C ~/.local/src/tabbed install

# Make zsh the default shell
sudo echo "export ZDOTDIR="$HOME"/.config/zsh" >> /etc/zsh/zshenv
chsh -s /usr/bin/zsh

# Block ads, fakenews, gambling and porn
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts > ~/hosts
sudo cp ~/hosts /etc/hosts
rm ~/hosts

# Change default shell (#!/bin/sh) to dash
ln -sfT dash /usr/bin/sh

# Configure warp-cli
sudo systemctl enable --now warp-svc.service
sleep 2
warp-cli register
warp-cli connect

# Cron
sudo systemctl enable --now cronie

# Espanso: text expander
espanso service register
espanso_pkgs=("lorem" "misspell-en-us" "misspell-en" "contractions-en")
for i in "${espanso_pkgs[@]}" ; do espanso install "$i" ; done

# Automatic CPU speed & power optimizer
systemctl enable auto-cpufreq

# Lock screen
wallpaper=$WALLPAPERS/trail.jpeg
betterlockscreen -u "$wallpaper"

# Smooth scrolling + MacOS/Windows like touchpad pinch-to-zoom in Firefox
# https://www.reddit.com/r/linux/comments/72mfv8/psa_for_firefox_users_set_moz_use_xinput21_to/
# https://www.reddit.com/r/linux/comments/rmuh0o/finally_macoswindows_like_touchpad_zoom_gesture/
echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh

# Other packages #############################

# Remove background from images
pip install rembg

# Touch alternative with a sprinkle of mkdir written in rust
sudo curl -L https://github.com/elliot40404/bonk/releases/latest/download/bonk_linux_x64 -o /usr/local/bin/bonk && sudo chmod +x /usr/local/bin/bonk
