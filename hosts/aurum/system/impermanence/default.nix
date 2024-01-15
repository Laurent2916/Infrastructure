{...}: {
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
    ];
    files = [
      "/etc/machine-id"
    ];
    # TODO: move this into home config, when silicium has impermanence too
    users.laurent = {
      directories = [
        "Documents"
        ".librewolf"
        ".thunderbird"
        ".local/share/direnv"
        ".local/share/keyrings"
        {
          directory = ".ssh";
          mode = "0700";
        }
      ];
    };
  };
}
