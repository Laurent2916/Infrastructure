{ hyprland, ... }: {
  config.home.stateVersion = "22.11";
  imports = [
    hyprland.homeManagerModules.default

    ./packages.nix

    ./alacritty
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
  ];
}
