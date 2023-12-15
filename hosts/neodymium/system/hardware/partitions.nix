{
  config,
  lib,
  ...
}: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b0ea5f1f-104f-4026-840a-4d46f3e827d1";
    fsType = "btrfs";
    options = ["subvol=nixos"];
  };

  boot.initrd.luks.devices."nixenc".device = "/dev/disk/by-uuid/93d0b0d8-b586-48cf-acc2-025fba1eaadb";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6D10-BBAF";
    fsType = "vfat";
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
