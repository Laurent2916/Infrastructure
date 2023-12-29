{
  description = "Laureηt's infrastructure";

  # TODO: rekey les secrets + changer la key de hydrogen
  # TODO: luks encrypt hydrogen (dropbear ?)
  # TODO: dégager btfrs de neodymium, ext4 ftw
  # TODO: setup disko sur neodymium

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      # url = "git+file:///home/laurent/Documents/nixpkgs?shallow=1";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default-linux";

    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    lanzaboote.url = "github:nix-community/lanzaboote";
    hyprland.url = "github:hyprwm/Hyprland";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.url = "github:nix-community/disko";
    nixos-anywhere.url = "github:nix-community/nixos-anywhere";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    resume.url = "git+https://git.fainsin.bzh/Laurent/resume";
    projet-intelligence-artificielle-multimedia.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-intelligence-artificielle-multimedia";
    projet-modelisation-geometrique.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-modelisation-geometrique";
    projet-systemes-algorithmes-repartis.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-systemes-algorithmes-repartis";
    projet-audionumerique.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-audionumerique";
    projet-oral-japonais.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-japonais";
    projet-oral-anglais.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-anglais";
    TP-calcul-parallele.url = "git+https://git.fainsin.bzh/ENSEEIHT/TP-calcul-parallele";
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
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
            pkgs.update-nix-fetchgit # auto update fetchs
            agenix.packages.${system}.ragenix # secrets
            pkgs.sbctl # secure boot
          ];
        };
      };

      flake.nixosConfigurations = import ./hosts {inherit inputs;};
    };
}
