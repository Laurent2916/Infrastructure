{
  pkgs,
  lib,
  ...
}: {
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    events = [
      {
        event = "after-resume";
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
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
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
      }
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
