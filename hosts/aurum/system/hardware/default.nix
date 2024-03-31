{pkgs, ...}: {
  # hardware
  hardware = {
    enableRedistributableFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  # logind configuration
  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=suspend
    '';
  };

  # tlp, power management
  services.tlp.enable = true;

  # thermald, controls temperature
  services.thermald.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # backlight intensity
  programs.light.enable = true;

  imports = [
    ./partitions.nix
  ];

  # tests, temporary or move this shit to nixos-hardware public repo
  # services.thermald.enable = lib.mkDefault true;

  # Includes the Wi-Fi and Bluetooth firmware for the QCA6390. ??????
  # hardware.enableRedistributableFirmware = true;

  # enable finger print sensor.
  # this has to be configured with `sudo fprintd-enroll <username>`.
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # Allows for updating firmware via `fwupdmgr`.
  services.fwupd.enable = true;

  # webcam bullshit fuck you intel
  # bugged my power down ? try to uninstall ? doesn't work anyway
  # hardware.firmware = [
  #   pkgs.ivsc-firmware
  # ];
  # hardware.ipu6 = {
  #   enable = true;
  #   platform = "ipu6ep";
  # };
}
