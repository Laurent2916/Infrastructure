{inputs, ...}: let
  nixpkgs = inputs.nixpkgs;
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.laurent = ./neodymium/home;
  };
in {
  # neodymium laptop
  neodymium = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./neodymium
      inputs.home-manager.nixosModules.home-manager
      inputs.agenix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-nvidia-disable
      inputs.nixos-hardware.nixosModules.common-pc-laptop
      inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
      {inherit home-manager;}
    ];
  };

  # hydrogen vps
  hydrogen = nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
      inherit system;
    };
    modules = [
      ./hydrogen
      inputs.home-manager.nixosModules.home-manager
      inputs.disko.nixosModules.default
      inputs.agenix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}
