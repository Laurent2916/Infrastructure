{
  inputs,
  pkgs,
  lib,
  ...
}: let
  hyprland_pkg = inputs.hyprland.packages."${pkgs.system}".hyprland;
in {
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    events = [
      {
        event = "after-resume";
        command = "${hyprland_pkg}/bin/hyprctl dispatch dpms on";
      }
      {
        event = "before-sleep";
        command = "${lib.getExe pkgs.swaylock-effects} -f";
      }
    ];
    timeouts = [
      {
        timeout = 120;
        command = "${lib.getExe pkgs.swaylock-effects} -f --grace 3";
      }
      {
        timeout = 150;
        command = "${hyprland_pkg}/bin/hyprctl dispatch dpms off";
      }
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
