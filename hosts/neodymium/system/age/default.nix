{...}: {
  age.secrets.borgbackup = {
    file = ../../../../secrets/borgbackup.age;
    owner = "laurent";
    group = "users";
  };
  age.identityPaths = ["/home/laurent/.ssh/id_ed25519"];
}
