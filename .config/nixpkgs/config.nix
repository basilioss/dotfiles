{
  # https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        aria2
        bat
        dash # Fast, POSIX-compliant shell (/bin/sh)
        delta
        fd
        ffmpeg
        fzf
        gallery-dl
        gcc
        gdu
        glow
        gum
        helix
        jq
        lsd # better ls
        neovim
        nodePackages_latest.bash-language-server # nvim bash lsp
        p7zip
        pup
        ripgrep
        shellcheck
        starship
        tmux
        trash-cli
        tree
        vimv
        wslu
        xdg-ninja
        xdg-utils
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
