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

  # enable finger print sensor.
  # this has to be configured with `sudo fprintd-enroll <username>`.
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # Allows for updating firmware via `fwupdmgr`.
  services.fwupd.enable = true;

  # webcam
  # hardware.firmware = [
  #   pkgs.ivsc-firmware
  # ];
  # hardware.ipu6 = {
  #   enable = true;
  #   platform = "ipu6ep";
  # };
}
