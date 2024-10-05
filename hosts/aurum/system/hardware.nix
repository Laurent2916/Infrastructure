{...}: {
  # graphics
  hardware.graphics.enable = true;

  # logind configuration
  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=suspend
    '';
  };

  # tlp, power management
  services.tlp.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # backlight intensity
  programs.light.enable = true;

  # impermanence
  fileSystems."/persist".requiredForBoot = true;

  # webcam
  # hardware.firmware = [
  #   pkgs.ivsc-firmware
  # ];
  # hardware.ipu6 = {
  #   enable = true;
  #   platform = "ipu6ep";
  # };
}
