{
  # https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    basePackages = pkgs.buildEnv {
      name = "base-packages";
      paths = [
        delta # A syntax-highlighting pager for git, diff, and grep output
        fzf # A command-line fuzzy finder
        helix # Text editor
        lsd # Better ls
        starship # Shell prompt
        tmux # Terminal multiplexer
        wslu # A collection of utilities for Windows Subsystem for Linux
        xdg-utils # For xdg-open
        zoxide # Better cd
        zsh
        zsh-autosuggestions # Fish-like autosuggestions for zsh
        zsh-fzf-tab # Replace zsh's default completion selection menu with fzf
        zsh-history-substring-search # ZSH port of Fish history search (up arrow)
        zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
      ];
    };
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        aria2
        bat
        dash
        fd
        ffmpeg
        gallery-dl
        gdu
        glow
        gum
        jq
        nodePackages_latest.bash-language-server
        p7zip
        pup
        ripgrep
        shellcheck
        shfmt
        trash-cli
        tree
        vimv
        xdg-ninja
        yt-dlp
        zk
        # mods # Command-line AI
        # scc # Count lines of code 
        # tmpmail
      ];
    };
    pathsToLink = [ "/share" "/bin" "/etc" ];
  };
}
