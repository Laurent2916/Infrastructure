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

  # WiFi HP printer
  # hardware.sane.enable = true;
  # users.users.laurent.extraGroups = ["scanner" "lp"];
  # hardware.sane.extraBackends = [pkgs.hplipWithPlugin];
  # services.avahi.enable = true;
  # services.avahi.nssmdns = true;

  # webcam
  # hardware.firmware = [
  #   pkgs.ivsc-firmware
  # ];
  # hardware.ipu6 = {
  #   enable = true;
  #   platform = "ipu6ep";
  # };
}
