{inputs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["${inputs.catppuccin-alacritty}/catppuccin-mocha.toml"];
      window.opacity = 0.85;
      font = {
        normal.family = "FiraCode Nerd Font Mono";
        size = 9.5;
      };
    };
  };
}
