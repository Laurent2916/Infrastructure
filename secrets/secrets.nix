let
  neodymium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
  hydrogen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxh42mMYqftTU7WtfktZbkdMI07VuH7mhUv3m2Ca3fV root@hydrogen";
in {
  "borgbackup.age".publicKeys = [neodymium];
  "gitea.age".publicKeys = [neodymium hydrogen];
}
