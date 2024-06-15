{inputs, ...}: {
  config.home.stateVersion = "24.05";

  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin

    ./packages.nix
    ./catppuccin

    ./alacritty
    ./firefox
    ./gtk
    ./shell
    ./thunderbird
    ./vscode
    ./wayland
    ./xdg
  ];
}
