{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
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
  };
}
