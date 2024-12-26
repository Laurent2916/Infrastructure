{...}: {
  system.stateVersion = "24.11";

  imports = [
    ./audio.nix
    ./boot.nix
    ./disko.nix
    ./docker.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./impermanence.nix
    ./lanzaboot.nix
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./users.nix
  ];
}
