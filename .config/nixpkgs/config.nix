{
  # https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        aria2
        bat
        dash # Fast, POSIX-compliant shell (/bin/sh)
        diff-so-fancy
        fd
        ffmpeg
        fzf
        gallery-dl
        gcc
        gdu
        glow
        gum
        jq
        lsd # better ls
        neovim
        nodePackages_latest.bash-language-server # nvim bash lsp
        p7zip
        pup
        ripgrep
        shellcheck
        starship
        thefuck
        tmux
        trash-cli
        tree
        vimv
        xdg-ninja
        zk # notes
        zoxide
        zsh
        zsh-autosuggestions
        zsh-fzf-tab
        zsh-history-substring-search
        zsh-syntax-highlighting
        # mods # Command-line AI
        # scc # Count lines of code 
        # tmpmail
      ];
    };
    pathsToLink = [ "/share" "/bin" "/etc" ];
  };
}
