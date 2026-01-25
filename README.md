# Dotfiles

```
Distribution:             Ubuntu
Package Manager:          Nix
Terminal:                 Windows Terminal
Terminal Multiplexer:     tmux
Shell:                    zsh
Prompt:                   Starship
Editor:                   Helix
Theme:                    Campbell and Tokyonight
Font:                     JetBrainsMono Nerd Font
```

## Installation

```sh
# Install Nix (https://nixos.org/download/#nix-install-windows)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Install dotfiles (https://www.atlassian.com/git/tutorials/dotfiles)
git clone --bare https://github.com/basilioss/dotfiles.git $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot checkout wsl
dot config --local status.showUntrackedFiles no

# Install packages (.config/nixpkgs/config.nix)
nix-env -iA nixpkgs.basePackages

# Make zsh the default shell
sudo chsh -s "$(command -v zsh)" "${USER}"

# Install tmux plugins (https://github.com/tmux-plugins/tpm)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux # Open tmux and press: Ctrl+Space + Shift+I
```

## Preview

![image](https://github.com/basilioss/dotfiles/assets/71596800/72ea1747-4f6b-4439-b89f-e68e7b389bad)
![image](https://github.com/basilioss/dotfiles/assets/71596800/bd174034-0b16-4d82-a180-cb299237acb1)

---

See also [gnome](https://github.com/basilioss/dotfiles/tree/gnome) and [dwm](https://github.com/basilioss/dotfiles/tree/dwm) branches
