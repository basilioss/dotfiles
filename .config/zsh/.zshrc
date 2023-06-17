# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically cd into typed directory
setopt autocd

# Ls whenever the current working directory is changed.
chpwd_ls() { ld }

# Activate comments
setopt interactivecomments

# Load aliases
source "$XDG_CONFIG_HOME/zsh/aliasrc"

### History ###################################################################

HISTFILE=~/.config/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # Ignore duplicated commands in history list.
setopt HIST_SAVE_NO_DUPS # Do not save duplicates in history file.
setopt INC_APPEND_HISTORY # Write to $HISTFILE immediately, not when the shell exits.
setopt INC_APPEND_HISTORY # Add commands to $HISTFILE in order of execution.
setopt HIST_IGNORE_SPACE # Ignore commands that start with a space.

### Completion ################################################################

# Basic auto/tab completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -i
_comp_options+=(globdots)		# Include hidden files.

# Completion for dotnet CLI
_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
}
zle -N _sgpt_zsh
bindkey ^a _sgpt_zsh

### Vi mode ###################################################################

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -r -sel c
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

### Keybindings ###############################################################

# Select and edit configs with Alt + Enter (dotbare)
bindkey -s '^[^M' "dotbare fedit"^M
# Accept autosuggestion with Ctrl + Space (autosuggestions plugin)
bindkey '^ ' autosuggest-accept
# History search
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down
# History search in vi mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

### Plugins ###################################################################

if [ -z "$TERMUX_VERSION" ]; then
  plugins_dir="/usr/share/zsh/plugins"
else
  plugins_dir="$XDG_CONFIG_HOME/zsh/plugins"
fi

source $plugins_dir/fzf-tab-git/fzf-tab.zsh 2>/dev/null
source $plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source $plugins_dir/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source $plugins_dir/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /etc/profile.d/undistract-me.sh 2>/dev/null

# Fix comment highlight
ZSH_HIGHLIGHT_STYLES[comment]=fg=#414868

is_installed() {
  command -v "$1" > /dev/null 
}

# Prompt
is_installed starship && eval "$(starship init zsh)" || true

# Quick cd/jump
is_installed zoxide && eval "$(zoxide init zsh --no-cmd)" || true

# App which corrects previous console commands
is_installed thefuck && eval "$(thefuck --alias)" || true
