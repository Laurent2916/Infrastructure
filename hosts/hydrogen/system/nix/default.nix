{
  lib,
  pkgs,
  inputs,
  ...
}: {
  # optimizations
  nix.settings.auto-optimise-store = true;
  nix.optimise = {
    automatic = true;
    dates = "daily";
  };

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };

  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # pin nixpkgs registry
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  # print diff between two generations
  system.activationScripts.nvd-report-changes = ''
    PATH=$PATH:${lib.makeBinPath [pkgs.nvd pkgs.nix]}
    nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
  '';
}
