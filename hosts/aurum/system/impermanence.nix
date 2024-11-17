{...}: {
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/fprint/"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
    ];
    files = [
      "/etc/machine-id"
    ];
    # TODO: move this into home config
    users.laurent = {
      directories = [
        "Documents"
        "Images"
        "Videos"
        ".mozilla"
        ".thunderbird"
        ".local/share/direnv"
        ".local/share/keyrings"
        ".local/share/atuin"
        ".config/gcloud"
        ".cache/nix"
        ".config/Code"
        ".vscode"
        {
          directory = ".ssh";
          mode = "0700";
        }
      ];
      files = [
        ".local/state/bemoji-history.txt"
        ".local/share/bemoji/emojis.txt"
        ".cache/cliphist/db"
        ".cache/fuzzel"
      ];
    };
  };
}
