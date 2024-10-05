{inputs, ...}: {
  config.home.stateVersion = "24.05";

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nix-index-database.hmModules.nix-index

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
