{pkgs, ...}: {
  imports = [
    ./system
    ./services
  ];

  # shorter timeout for systemd services
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    config = {
      common.default = ["wlr" "gtk"];
      hyprland.default = ["hyprland"];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs.zsh.enable = true;

  # enable gnome virtual file system
  services.gvfs.enable = true;
}
