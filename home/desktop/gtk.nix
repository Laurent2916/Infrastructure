{pkgs, ...}: {
  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.inter;
      size = 10;
    };
  };

  catppuccin.gtk = {
    enable = true;
    size = "compact";
    tweaks = ["rimless" "normal"];
    icon.enable = true;
  };

  home.pointerCursor = {
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  catppuccin.cursors = {
    enable = true;
    accent = "dark";
  };
}
