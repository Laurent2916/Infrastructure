{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    sessionVariables = {
      VISUAL = "micro";
      EDITOR = "micro";
      WORDCHARS = "*?_-.[]~=&;!#$%^(){}<>";
    };
    history = {
      size = 1000000000;
      path = "$HOME/.zsh_history";
      extended = true;
    };
    initExtra = ''
      bindkey -e
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
    '';
    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "227d284ab2dc2f5153826974e0094a1990b1b5b9";
        sha256 = "11mkq58ssafvkq8sq27v0dl19mi2myi392nhxgi1q2q9q0gazcaa";
      };
    }];
  };
}
