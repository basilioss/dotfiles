# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Automatically cd into typed directory.
setopt autocd

# Activate comments
setopt interactivecomments

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Load aliases
source "$XDG_CONFIG_HOME/shell/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Vi mode
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

# Change cursor shape for different vi modes.
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

# Accept autosuggestion with Ctrl + Space
bindkey '^ ' autosuggest-accept

# Plugins
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Starhship prompt
eval "$(starship init zsh)"

# The fuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init zsh)"

# Open new st tab in tabbed with specified title
# Example: stt dwm config
function stt () {
    title="$@"
    #st -t "$title" -w $XEMBED & disown
    nohup st -t "$title" -w $XEMBED &
}

# Select and edit configs
bindkey -s '^g' "dotbare fedit"^j

function dic() {
	sdcv -n --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
