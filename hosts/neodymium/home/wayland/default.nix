{ pkgs, ... }:
let
  catppuccin-mako = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "mako";
    rev = "64ef71633528b50e5475755e50071584b54fa291";
    sha256 = "007zr906q7s31xgn9xw3jl8zdg5wapixva01qniclna1y0yxlqr7";
  };
in {

  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./eww;
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    extraConfig = builtins.readFile "${catppuccin-mako}/src/mocha";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    recommendedEnvironment = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

}
