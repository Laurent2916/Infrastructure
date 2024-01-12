{...}: {
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

  # partitions and filesystems
  imports = [
    ./partitions.nix
  ];
}
