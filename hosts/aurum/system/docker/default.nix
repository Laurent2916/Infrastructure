{...}: {
  virtualisation.docker = {
    enable = true;

    storageDriver = "btrfs";
    enableOnBoot = false;
    autoPrune.enable = true;
  };

  # docker users
  users.users.laurent.extraGroups = ["docker"];
}
