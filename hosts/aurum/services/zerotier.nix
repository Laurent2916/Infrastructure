{lib, ...}: {
  services.zerotierone = {
    enable = true;
  };

  # do not start the service by default
  systemd.services.zerotierone.wantedBy = lib.mkForce [];

  # persist the configs
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/zerotier-one"
    ];
  };

  # # list of allowed unfree packages
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     pkgs.zerotierone
  #   ];
}
