{ pkgs, ... }:
let
  catppuccin-mako = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "mako";
    rev = "9dd088aa5f4529a3dd4d9760415e340664cb86df";
    sha256 = "097x9jrkzvml6ngnhxwkzzl1l2awwv73yli1mhmpw83c0n8xck4x";
  };
in {

  imports = [ ./hyprland ./eww ];

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    extraConfig = builtins.readFile "${catppuccin-mako}/src/mocha";
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        line-height = 15;
        lines = 10;
        layer = "overlay";
      };
      colors = {
        background = "1E1E2EEE";
        text = "7F849CFF";
        match = "89B4FAFF";
        selection = "45475AFF";
        selection-text = "CDD6F4FF";
        selection-match = "89B4FAFF";
      };
    };
  };

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
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 120;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f --grace 3";
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

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      image = "/home/laurent/Pictures/wallpapers/kai-oberhauser-unsplash.jpg";

      clock = true;
      timestr = "%T";
      datestr = "%F";

      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;

      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";

      ring-color = "bb00cc";
      key-hl-color = "880033";

      line-color = "00000000";
      inside-color = "00000088";
      separator-color = "00000000";

      text-color = "fffffff";
    };
  };

}
