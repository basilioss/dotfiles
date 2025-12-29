# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_LIB_HOME="${HOME}/.local/lib"

# Recursively add $XDG_BIN_HOME to $PATH
export PATH="$PATH:/home/$USER/.nix-profile/bin:${$(find $XDG_BIN_HOME -type d -printf %p:)%%:}"

# Apps
export EDITOR=hx
export VISUAL=hx

# Directories
export NOTES_DIR="/mnt/d/share/notes"

# Environment
#export LS_COLORS="$(dircolors)"
export COLORTERM=truecolor
export BAT_THEME="base16"
export FZF_DEFAULT_OPTS=" \
-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all \
--color=bg+:#24283b,pointer:1,border:8,separator:8"

# $HOME Cleanup (https://github.com/b3nj5m1n/xdg-ninja)
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE="$XDG_DATA_HOME"/lesshst
export NVM_DIR="$XDG_DATA_HOME"/nvm
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GOPATH="$XDG_DATA_HOME"/go
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/x11/xcompose
export GTK_IM_MODULE=xim
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH="/usr/share/icons:${XDG_DATA_HOME}/icons"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PYTHONSTARTUP="/etc/python/pythonrc" # ~/.python_history
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
