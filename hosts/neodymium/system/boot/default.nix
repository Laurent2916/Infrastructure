{ pkgs, ... }: {
  # support for mounting windaube partitions
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.efi.canTouchEfiVariables = true;

  # clean /tmp at each boot
  boot.tmp.cleanOnBoot = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [ ./lanzaboot.nix ];
}
