{ ... }: {
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

  # enable unfree
  nixpkgs.config.allowUnfree = true;
}
