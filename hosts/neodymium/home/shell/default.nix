{ pkgs, lib, ... }:
let
  catppuccin-bat = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
  };
in {
  programs.bat = {
    enable = true;
    themes = {
      catppuccin =
        builtins.readFile "${catppuccin-bat}/Catppuccin-mocha.tmTheme";
    };
    config.theme = "catppuccin";
    extraPackages = with pkgs.bat-extras; [ batman ];
  };
  programs.zsh.shellAliases = {
    cat = "bat";
    man = "batman";
  };

  programs.exa = { enable = true; };
  programs.zsh.shellAliases = {
    l =
      "exa -lahg --icons --git --time-style=long-iso --group-directories-first --color=always";
    ll = "l --grid";
  };

  programs.git = {
    enable = true;
    userName = "Laureηt";
    userEmail = "laurent@fainsin.bzh";
    signing = {
      signByDefault = true;
      key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
    };
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    sessionVariables = {
      MANPAGER = "nvim +Man!";
      VISUAL = "nvim";
      EDITOR = "nvim";
      WORDCHARS = "*?_-.[]~=&;!#$%^(){}<>";
    };
    history = {
      size = 1000000000;
      path = "$HOME/.zsh_history";
      extended = true;
    };
    loginExtra = ''
      if [[ "$(tty)" == "/dev/tty1" ]]; then
        exec sway
      fi
    '';
    initExtra = ''
      bindkey -e
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
      # eval "$(atuin init zsh)"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./.;
        file = ".p10k.zsh";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "af6f8a266ea1875b9a3e86e14796cadbe1cfbf08";
          sha256 = "1x6941n43j3fh1zd82v9gzr83d70gasf1s7rh6fzlby4ha20qf06";
        };
      }
    ];
  };
}
