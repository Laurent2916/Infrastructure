{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./system ];

  # shorter timeout for systemd services
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  # udev
  services.udev.packages = [ pkgs.android-udev-rules ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };

  users = {
    # disable user creation/deletion
    mutableUsers = false;

    # damn, who's this handsome guy?
    users.laurent = {
      isNormalUser = true;
      initialPassword = "laurent";
      extraGroups = [ "wheel" "video" "docker" "adbusers" ];
      shell = pkgs.zsh;
    };
  };
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.laurent = ./home;
  };

  # enable gnome virtual file system
  services.gvfs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
