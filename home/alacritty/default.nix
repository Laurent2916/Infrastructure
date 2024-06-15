{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;
      font = {
        normal.family = "FiraCode Nerd Font Mono";
        size = 9.5;
      };
    };
  };
}
