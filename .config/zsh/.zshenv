# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_LIB_HOME="${HOME}/.local/lib"

# Recursively add $XDG_BIN_HOME to $PATH
export PATH="$PATH:${$(find $XDG_BIN_HOME -type d -printf %p:)%%:}"
export PATH="$PATH:$HOME/.dotnet/tools"

if command -v systemctl > /dev/null; then
  systemctl --user import-environment XDG_CONFIG_HOME XDG_DATA_HOME \
    XDG_BIN_HOME XDG_CACHE_HOME XDG_STATE_HOME XDG_LIB_HOME PATH
fi

# Apps
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=alacritty
export BROWSER=firefox
export READER=zathura

# Directories
export SCREENSHOTS="$HOME/main/pix/screenshots"
export WALLPAPERS="$HOME/main/pix/wallpapers"
export MUSIC_DIR="$HOME/main/lib/music"
export NOTES_DIR="$ZK_NOTEBOOK_DIR/pages"
export ZK_NOTEBOOK_DIR="$HOME/main/notes"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export STARDICT_DATA_DIR="$HOME/main/lib/other/dictionaries"

# Environment
export LS_COLORS="$(dircolors)"
export MDT_EDITOR='nvim -c "set nonumber"'
export MDT_ITEM_WIDTH=0
export BAT_THEME="base16" export QT_AUTO_SCREEN_SCALE_FACTOR=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FZF_DEFAULT_OPTS="-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all --color='bg+:#24283b,pointer:1,border:8,separator:8'"

# Use GTK3 theme for Qt apps
# export GTK2_RC_FILES="$XDG_DATA_HOME/themes/tokyonight/gtk-2.0/gtkrc"
export QT_QPA_PLATFORMTHEME=gtk3

# $HOME Cleanup (https://github.com/b3nj5m1n/xdg-ninja)
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
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

# Android specific environment
if [[ "$TERMUX_VERSION" != "" ]]; then
  export ZK_NOTEBOOK_DIR="$HOME/storage/shared/Documents/notes"
  export FZF_DEFAULT_OPTS="-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all --color=16"
fi
