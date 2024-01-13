let
  silicium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@silicium";
  cesium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVxpWbNJl+OXe6YImMpsJprfuTd+9UJVTiteiuyx6oP root@cesium";
in {
  "borgbackup.age".publicKeys = [silicium];
  "gitea.age".publicKeys = [silicium cesium];
}
