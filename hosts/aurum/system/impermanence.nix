{...}: {
  programs.fuse.userAllowOther = true; # require by home.impermanence.allowOther

  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/fprint"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
