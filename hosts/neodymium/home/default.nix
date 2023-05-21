{ ... }: {
  config.home.stateVersion = "22.11";
  imports = [
    ./packages.nix

    ./alacritty
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
  ];
}
