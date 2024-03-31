{inputs, ...}: {
  config.home.stateVersion = "23.05";
  imports = [
    inputs.hyprland.homeManagerModules.default

    ./packages.nix

    ./alacritty
    ./firefox
    ./gtk
    ./mpv
    ./shell
    ./thunderbird
    ./vscode
    ./wayland
    ./xdg
  ];
}
