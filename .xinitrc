#!/bin/sh

userresources=$HOME/.config/x11/xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

slstatus &
clipmenud &
sxhkd &
setxkbmap us,ru,ua &
remaps &
unclutter &
syncthing --no-browser &
warp-cli connect &
picom &
# Set wallpaper
pic="$(find ~/hdd/library/pictures/wallpapers/ -maxdepth 1 -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -type f | shuf -n 1)" && xwallpaper --zoom "$pic" &
exec dwm
