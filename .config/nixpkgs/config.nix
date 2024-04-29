{
  # https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        aria2
        bat
        dash
        delta
        fd
        ffmpeg
        fzf
        gallery-dl
        gdu
        glow
        gum
        helix
        jq
        lsd
        nodePackages_latest.bash-language-server
        p7zip
        pup
        ripgrep
        shellcheck
        shfmt
        starship
        tmux
        trash-cli
        tree
        vimv
        wslu
        xdg-ninja
        xdg-utils
        zk
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
