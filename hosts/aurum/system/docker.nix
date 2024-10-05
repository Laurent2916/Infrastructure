{...}: {
  virtualisation.docker = {
    enable = true;

    enableOnBoot = false;
    autoPrune.enable = true;
  };

  # docker users
  users.users.laurent.extraGroups = ["docker"];
}
