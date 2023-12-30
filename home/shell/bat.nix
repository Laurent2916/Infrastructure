{
  inputs,
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;

    themes = {
      catppuccin = {
        src = inputs.catppuccin-bat;
        file = "Catppuccin-mocha.tmTheme";
      };
    };
    config.theme = "catppuccin";
    extraPackages = with pkgs.bat-extras; [batman];
  };

  programs.zsh.shellAliases = {
    cat = "bat";
    man = "batman";
  };
}
