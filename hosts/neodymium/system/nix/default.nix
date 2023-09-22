{ lib, pkgs, nixpkgs, ... }: {
  # restrict nix command to sudoers
  nix.settings.allowed-users = [ "@wheel" ];

  # experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # optimizations
  nix.settings.auto-optimise-store = true;

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # binary caches
  nix.settings = {
    substituters =
      [ "https://hyprland.cachix.org" "https://nix-community.cachix.org" ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # pin nixpkgs registry
  nix.registry.nixpkgs.flake = nixpkgs;

  # list of allowed unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "vscode"
      "vscode-extension-github-copilot"
      "vscode-extension-github-copilot-chat"
      "vscode-extension-ms-vsliveshare-vsliveshare"
    ];

  system.activationScripts.nvd-report-changes = ''
    PATH=$PATH:${lib.makeBinPath [ pkgs.nvd pkgs.nix ]}
    nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
  '';
}
