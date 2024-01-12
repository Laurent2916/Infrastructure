{
  lib,
  pkgs,
  inputs,
  ...
}: {
  # restrict nix command to sudoers
  nix.settings.allowed-users = ["root" "@wheel"];
  nix.settings.trusted-users = ["root" "@wheel"];

  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # limit number of cores when building
  nix.settings.max-jobs = 6;

  # optimizations
  nix.settings.auto-optimise-store = true;
  nix.optimise = {
    automatic = true;
    dates = "12:00";
  };

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "12:00";
    options = "--delete-older-than 30d";
  };

  # pin nixpkgs registry
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  # list of allowed unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "vscode"
      "vscode-extension-github-copilot"
      "vscode-extension-github-copilot-chat"
      "vscode-extension-ms-vsliveshare-vsliveshare"
    ];

  # print diff between two generations
  system.activationScripts.nvd-report-changes = ''
    PATH=$PATH:${lib.makeBinPath [pkgs.nvd pkgs.nix]}
    nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
  '';
}
