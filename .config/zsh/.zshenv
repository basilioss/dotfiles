# Recursively add $XDG_BIN_HOME to $PATH
export PATH="$PATH:${$(find $XDG_BIN_HOME -type d -printf %p:)%%:}"
export PATH="$PATH:$HOME/.dotnet/tools:$GOPATH/bin"

# Apps
export EDITOR=helix
export VISUAL=helix
export BROWSER=firefox

# Directories
export SCREENSHOTS="$HOME/main/pix/screenshots"
export WALLPAPERS="$HOME/main/pix/wallpapers"
export MUSIC_DIR="$HOME/main/lib/music"
export NOTES_DIR="$HOME/main/share/notes"
export DOTBARE_DIR="$HOME/.dotfiles"

# Environment
export LS_COLORS="$(dircolors)"
export COLORTERM=truecolor
export BAT_THEME="base16"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FZF_DEFAULT_OPTS="-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
export QT_QPA_PLATFORMTHEME=gtk3
export MOZ_ENABLE_WAYLAND=1

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
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/x11/xcompose
export GTK_IM_MODULE=xim
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# export XCURSOR_PATH="/usr/share/icons:${XDG_DATA_HOME}/icons"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PYTHONSTARTUP="/etc/python/pythonrc" # ~/.python_history
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
