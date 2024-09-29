{
  description = "Laureηt's infrastructure";

  # TODO: luks encrypt cesium (dropbear ?)
  # TODO: setup disko sur silicium

  inputs = {
    # core stuff
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      # url = "git+file:///home/laurent/Documents/github.com/NixOS/nixpkgs?shallow=1";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems = {
      url = "github:nix-systems/default-linux";
    };

    # modules
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.systems.follows = "systems";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      # inputs.nixpkgs.follows = "nixpkgs";  # leads to many recompilations
    };
    nixos-hardware = {
      url = "github:Laurent2916/nixos-hardware/dell-xps-9315";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };

    # home stuff
    wallpaper = {
      url = "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28";
      flake = false;
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };

    # cesium nginx sites
    website = {
      url = "git+https://git.fainsin.bzh/Laurent/website";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    resume = {
      url = "git+https://git.fainsin.bzh/Laurent/resume";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-intelligence-artificielle-multimedia = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-intelligence-artificielle-multimedia";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-modelisation-geometrique = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-modelisation-geometrique";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-systemes-algorithmes-repartis = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-systemes-algorithmes-repartis";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-audionumerique = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-audionumerique";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-oral-japonais = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-japonais";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    projet-oral-anglais = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-anglais";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    TP-calcul-parallele = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/TP-calcul-parallele";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    TP-reinforcement-learning = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/TP-reinforcement-learning";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
    TP-traitement-audio-visuel = {
      url = "git+https://git.fainsin.bzh/ENSEEIHT/TP-traitement-audio-visuel";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.systems.follows = "systems";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = {
    agenix,
    flake-parts,
    treefmt-nix,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      imports = [
        flake-parts.flakeModules.easyOverlay
        treefmt-nix.flakeModule
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: rec {
        formatter = pkgs.alejandra;

        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            deadnix.enable = true;
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [
            formatter # defined above
            pkgs.git # version control
            pkgs.sbctl # secure boot utils
            agenix.packages.${system}.agenix # secrets
          ];
        };
      };

      flake.nixosConfigurations = import ./hosts {inherit inputs;};
    };
}
