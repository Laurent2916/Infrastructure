{modulesPath, ...}: {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  imports = [
    # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/scan/not-detected.nix
    (modulesPath + "/installer/scan/not-detected.nix")
    # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix
    (modulesPath + "/profiles/qemu-guest.nix")

    ./boot
    ./disko
    ./networking
    ./packages
    ./users
  ];
}
