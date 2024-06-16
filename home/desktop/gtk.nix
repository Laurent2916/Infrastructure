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
      cursor = {
        enable = true;
        accent = "dark";
      };
    };
  };
}
