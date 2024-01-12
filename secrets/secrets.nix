let
  silicium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@silicium";
  cesium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxh42mMYqftTU7WtfktZbkdMI07VuH7mhUv3m2Ca3fV root@cesium";
in {
  "borgbackup.age".publicKeys = [silicium];
  "gitea.age".publicKeys = [silicium cesium];
}
