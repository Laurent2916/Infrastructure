{inputs, ...}: {
  xdg.configFile."btop/themes".source = "${inputs.catppuccin-btop}/themes";

  programs.btop = {
    enable = true;

    settings = {
      theme_background = false;
      color_theme = "catppuccin_mocha";
      clock_format = "%Y-%m-%d %X";
    };
  };

  programs.fish.shellAliases.htop = "btop";
}
