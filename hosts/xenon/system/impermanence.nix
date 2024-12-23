{...}: {
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/forgejo"
      "/var/lib/paperless"
      "/var/lib/postgresql"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
