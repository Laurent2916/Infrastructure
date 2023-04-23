{
  description = "Laureηt's infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
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

    webcord = {
      url = "github:fufexan/webcord-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, flake-utils, lanzaboote, agenix, home-manager, webcord, ... }:

    # Provide colmena
    (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.colmena
            pkgs.nixfmt
            pkgs.git
            pkgs.update-nix-fetchgit
            agenix.packages.${system}.ragenix
          ];
        };
      })) // {

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
              agenix.nixosModules.default
              lanzaboote.nixosModules.lanzaboote
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
