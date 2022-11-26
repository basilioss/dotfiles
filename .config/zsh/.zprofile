# Xcompose
# https://wiki.archlinux.org/title/Xorg/Keyboard_configuration#Key_combinations
export XMODIFIERS="@im=none"
# Auto start X at login
# https://wiki.archlinux.org/title/Silent_boot#startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
fi
