{inputs, ...}: {
  config.home.stateVersion = "24.05";

  imports = [
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
}
