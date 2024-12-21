{
  pkgs,
  config,
  lib,
  ...
}: {
  boot.loader.systemd-boot.enable = true;

  # impermanence
  fileSystems."/persist".neededForBoot = true;

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
