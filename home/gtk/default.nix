{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.inter;
      size = 10;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "compact";
        tweaks = [ "rimless" "normal" ];
        variant = "mocha";
      };
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };
}
