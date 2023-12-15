{inputs, ...}: {
  config.home.stateVersion = "23.05";
  imports = [
    inputs.hyprland.homeManagerModules.default

    ./packages.nix

    ./alacritty
    ./chromium
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
    ./xdg
  ];
}
