{ ... }: {
  programs.exa.enable = true;
  programs.zsh.shellAliases = {
    l =
      "exa -lahg --icons --git --time-style=long-iso --group-directories-first --color=always";
    ll = "l --grid";
  };
}
