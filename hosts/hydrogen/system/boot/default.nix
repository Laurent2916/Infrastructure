{ pkgs, ... }: {
  # clean /tmp at each boot
  boot.tmp.cleanOnBoot = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
