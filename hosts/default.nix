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

  # home server
  xenon = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
    };
    modules = [
      ./xenon
      inputs.nixos-hardware.nixosModules.common-cpu-intel
      inputs.nixos-hardware.nixosModules.common-pc-ssd
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}
