{...}: {
  virtualisation.docker = {
    enable = true;

    enableOnBoot = false;
    autoPrune.enable = true;
    storageDriver = "btrfs";
  };

  # docker users
  users.users.laurent.extraGroups = ["docker"];
}
