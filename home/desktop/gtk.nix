{pkgs, ...}: {
  gtk = {
    enable = true;

    font = {
      name = "Inter";
      package = pkgs.inter;
      size = 10;
    };

    catppuccin = {
      enable = true;
      size = "compact";
      tweaks = ["rimless" "normal"];
      icon = {
        enable = true;
      };
    };
  };

  catppuccin.pointerCursor = {
    enable = true;
    accent = "dark";
  };
}
