{...}: {
  system.stateVersion = "24.11";

  imports = [
    ./boot.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];
}
