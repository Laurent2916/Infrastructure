{ ... }: {
  virtualisation.docker = {
    enable = true;

    storageDriver = "btrfs";
    enableOnBoot = false;
    autoPrune.enable = true;
  };
}
