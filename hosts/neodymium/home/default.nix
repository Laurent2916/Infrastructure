{ hyprland, ... }: {
  config.home.stateVersion = "23.05";
  imports = [
    hyprland.homeManagerModules.default

    ./packages.nix

    ./alacritty
    ./chromium
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
  ];
}
