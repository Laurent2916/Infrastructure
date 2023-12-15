{
  description = "Laureηt's infrastructure";

  # TODO: setup le formatter comme sioodmy
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
    # atuin.url = "github:atuinsh/atuin";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    resume.url = "git+https://git.fainsin.bzh/Laurent/resume";
    projet-intelligence-artificielle-multimedia.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-intelligence-artificielle-multimedia";
    projet-audionumerique.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-audionumerique";
    projet-oral-japonais.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-japonais";
    projet-oral-anglais.url = "git+https://git.fainsin.bzh/ENSEEIHT/projet-oral-anglais";
    TP-calcul-parallele.url = "git+https://git.fainsin.bzh/ENSEEIHT/TP-calcul-parallele";
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://pre-commit-hooks.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  outputs = {
    nixpkgs,
    agenix,
    flake-parts,
    lanzaboote,
    home-manager,
    nixos-hardware,
    disko,
    pre-commit-hooks,
    treefmt-nix,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      imports = [
        flake-parts.flakeModules.easyOverlay
        pre-commit-hooks.flakeModule
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

        pre-commit = {
          settings.excludes = ["flake.lock"];
          settings.hooks = {
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

      flake.nixosConfigurations = {
        # neodymium laptop
        neodymium = nixpkgs.lib.nixosSystem {
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
        hydrogen = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./hosts/hydrogen
            home-manager.nixosModules.home-manager
            disko.nixosModules.default
            agenix.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };
    };
}
