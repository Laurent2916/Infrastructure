{
  lib,
  pkgs,
  nixpkgs,
  ...
}: {
  # optimizations
  nix.settings.auto-optimise-store = true;

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # pin nixpkgs registry
  nix.registry.nixpkgs.flake = nixpkgs;

  # print diff between two generations
  system.activationScripts.nvd-report-changes = ''
    PATH=$PATH:${lib.makeBinPath [pkgs.nvd pkgs.nix]}
    nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
  '';
}
