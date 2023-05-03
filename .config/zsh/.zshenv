# Recursively adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}:$HOME/.dotnet/tools"

# Default programs
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=st
export BROWSER=firefox
export READER=zathura

# Default directories
export SCREENSHOTS="$HOME/main/pix/screenshots"
export WALLPAPERS="$HOME/main/lib/pix/wallpapers"
export MUSIC_DIR="$HOME/main/lib/music"
export NOTES_DIR="$ZK_NOTEBOOK_DIR/pages"
export STARDICT_DATA_DIR="$HOME/main/lib/other/dictionaries"

# Environment
export DOTBARE_DIR="$HOME/.dotfiles"
export ZK_NOTEBOOK_DIR="$HOME/main/notes"
export DOTBARE_TREE="$HOME"
export MDT_EDITOR='nvim -c "set nonumber"'
export MDT_ITEM_WIDTH=0
export BAT_THEME="base16" export QT_AUTO_SCREEN_SCALE_FACTOR=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FZF_DEFAULT_OPTS="-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all --color='bg+:#24283b,pointer:1,border:8,separator:8'"

# Use GTK3 theme for Qt apps
export QT_QPA_PLATFORMTHEME=gtk3

# $HOME cleanup (https://github.com/b3nj5m1n/xdg-ninja)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTFILE="${XDG_STATE_HOME}"/bash/history
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export NVM_DIR="$XDG_DATA_HOME"/nvm
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GOPATH="$XDG_DATA_HOME"/go
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# xinit
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
# XCompose
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/x11/xcompose
export GTK_IM_MODULE=xim
# android-studio
export ANDROID_HOME="$XDG_DATA_HOME"/android
# gtk-2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# icons
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
# ~/.python_history (require ~/.config/python/pythonrc)
export PYTHONSTARTUP="/etc/python/pythonrc"
# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Dotnet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wine
# parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
# JAVA
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# Rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
