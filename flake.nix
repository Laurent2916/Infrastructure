{
  description = "Laureηt's infrastructure";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      # url = "git+file:///home/laurent/Documents/nixpkgs?shallow=1";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = { url = "github:nixos/nixos-hardware"; };

    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  nixConfig = {
    extra-substituters =
      [ "https://nix-community.cachix.org" "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  outputs = { nixpkgs, flake-utils, lanzaboote, agenix, home-manager
    , nixos-hardware, ... }@inputs:

    (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nixfmt # formatting
            pkgs.git # version control
            pkgs.update-nix-fetchgit # auto update fetchs
            agenix.packages.${system}.ragenix # secrets
            pkgs.sbctl # secure boot
          ];
        };
      })) // {

        # neodymium laptop
        nixosConfigurations.neodymium = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = [
            ./hosts/neodymium
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-nvidia-disable
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-ssd
          ];
        };

        # hydrogen vps
        nixosConfigurations.hydrogen = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/hydrogen
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };
}
