{ pkgs, ... }:
let
  catppuccin-mako = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "mako";
    rev = "9dd088aa5f4529a3dd4d9760415e340664cb86df";
    sha256 = "097x9jrkzvml6ngnhxwkzzl1l2awwv73yli1mhmpw83c0n8xck4x";
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
