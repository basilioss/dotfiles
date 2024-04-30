{
  # https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    basicPackages = pkgs.buildEnv {
      name = "basic-packages";
      paths = [
        delta # A syntax-highlighting pager for git, diff, and grep output
        fzf # A command-line fuzzy finder
        helix # Text editor
        lsd # Better ls
        starship # Shell prompt
        tmux # Terminal multiplexer
        zoxide # Better cd
        zsh
        zsh-autosuggestions # Fish-like autosuggestions for zsh
        zsh-fzf-tab # Replace zsh's default completion selection menu with fzf
        zsh-history-substring-search # ZSH port of Fish history search (up arrow)
        zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
        # ripgrep
        # wslu # A collection of utilities for Windows Subsystem for Linux
        # xdg-utils
      ];
    };
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
