{inputs, ...}: {
  config.home.stateVersion = "23.05";
  imports = [
    inputs.hyprland.homeManagerModules.default

    ./packages.nix

    ./alacritty
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
    ./xdg
  ];
}
