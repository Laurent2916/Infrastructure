{...}: {
  programs.eza.enable = true;
  programs.fish.shellAliases = {
    l = "eza -lahg --icons --git --time-style=long-iso --group-directories-first --color=always";
    ll = "l --grid";
  };
}
