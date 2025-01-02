{...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-family = "FiraCode Nerd Font Mono";
      gtk-single-instance = true;
      background-opacity = 0.85;
      window-decoration = false;
      font-size = 9.5;
    };
  };
}
