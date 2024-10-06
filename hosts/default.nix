{inputs, ...}: let
  nixpkgs = inputs.nixpkgs;
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.laurent = ../home;
  };
in {
  # naming convention based on the periodic table
  # NAS would be neodymium
  # desktop would be neon
  # smartphone would be lithium

  # work laptop
  aurum = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
    };
    modules = [
      ./aurum
      inputs.catppuccin.nixosModules.catppuccin
      inputs.nixos-hardware.nixosModules.dell-xps-13-9315
      inputs.home-manager.nixosModules.home-manager
      inputs.impermanence.nixosModules.impermanence
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.disko.nixosModules.default
      {inherit home-manager;}
    ];
  };

  # vps
  cesium = nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
      inherit system;
    };
    modules = [
      ./cesium
      inputs.disko.nixosModules.default
      inputs.agenix.nixosModules.default
    ];
  };
}
