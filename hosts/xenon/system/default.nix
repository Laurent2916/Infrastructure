{...}: {
  system.stateVersion = "24.11";

  imports = [
    ./boot.nix
    ./disko.nix
    ./i18n.nix
    ./impermanence.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];
}
