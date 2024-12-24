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
    dates = ["12:00"];
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

  # limit number of cores when building
  nix.settings.max-jobs = 4;

  # enable auto updates
  system.autoUpgrade = {
    enable = true;
    dates = "*-*-* 09:00:00";
    randomizedDelaySec = "1h";
    flake = "github:Laurent2916/Infrastructure";
  };

  # print diff between two generations
  system.activationScripts.nvd-report-changes = ''
    PATH=$PATH:${lib.makeBinPath [pkgs.nvd pkgs.nix]}
    nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
  '';
}
