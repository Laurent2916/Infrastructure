{...}: {
  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@silicium"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIItSJTtS7tO0Wz/WgHAFb3xuNFZpm8SOvr/o8uR83zzy laurent@aurum"
  ];
}
