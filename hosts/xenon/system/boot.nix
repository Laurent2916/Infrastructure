{
  pkgs,
  config,
  lib,
  ...
}: {
  boot.loader.systemd-boot.enable = true;

  boot.initrd.luks.devices."luks-c1ff525c-0a50-4c66-8cc5-f7287a594aed".device = "/dev/disk/by-uuid/c1ff525c-0a50-4c66-8cc5-f7287a594aed";
  boot.initrd.luks.devices."luks-9073beee-c266-43e3-bb8e-23f7cb8fc5e0".device = "/dev/disk/by-uuid/9073beee-c266-43e3-bb8e-23f7cb8fc5e0";

  # partition layout
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/047eecfe-5677-4980-a804-e42a166da15d";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D94B-B6D1";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };
  swapDevices = [
    {
      device = "/dev/disk/by-uuid/7816b481-079d-4823-bcf1-f94e28319310";
    }
  ];

  # clean /tmp at each boot
  boot.tmp.cleanOnBoot = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
}
