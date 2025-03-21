{
  pkgs,
  config,
  lib,
  ...
}: {
  # support for mounting windaube partitions
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.efi.canTouchEfiVariables = true;

  # clean /tmp at each boot
  boot.tmp.cleanOnBoot = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod"];
  boot.kernelModules = ["kvm-intel"];
}
