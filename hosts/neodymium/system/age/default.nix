{ ... }: {
  age.secrets.borgbackup = {
    file = "/home/laurent/infrastructure/secrets/borgbackup.age";
    owner = "laurent";
    group = "users";
  };
  age.identityPaths = [ "/home/laurent/.ssh/id_ed25519" ];
}
