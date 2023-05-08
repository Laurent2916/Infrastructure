{ ... }: {
  config.home.stateVersion = "22.11";
  imports = [
    ./packages.nix

    ./alacritty
    ./discord
    ./firefox
    ./gtk
    ./shell
    ./vscode
    ./wayland
  ];
}
