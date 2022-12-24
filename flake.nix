{
  description = "Laureηt's infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    webcord.url = "github:fufexan/webcord-flake";
  };

  outputs = { nixpkgs, home-manager, webcord, ... }@inputs: {
    # colmena
    colmena = {
      meta = {
        nixpkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [ ];
        };
      };

      # default config
      defaults = { name, ... }: {
        imports = [
          ./hosts/${name}/configuration.nix
          home-manager.nixosModules.home-manager
        ];
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
        };
      };

      # personnal laptop
      neodymium = { ... }: {
        home-manager.users.laurent = {
          imports = [ webcord.homeManagerModules.default ];
        };
        deployment = {
          allowLocalDeployment = true;
          targetHost = null;
        };
      };

      # ovh vps
      hydrogen = { ... }: {
        deployment = {
          targetHost = "178.62.253.235";
          targetUser = "root";
        };
      };
    };
  };
}
