{inputs, ...}: {
  config.home.stateVersion = "24.05";

  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin

    ./applications
    ./desktop
    ./shell

    ./packages.nix
  ];

  config.catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  #   accent = "blue";
  # };
}
