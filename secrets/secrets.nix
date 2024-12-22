let
  silicium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@silicium"; # TODO: remove this
  aurum = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIItSJTtS7tO0Wz/WgHAFb3xuNFZpm8SOvr/o8uR83zzy laurent@aurum";
  laurent = [silicium aurum];

  xenon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQIVwJ/EwChjp57My/v/tPhtcDCvdaRE2XZWUCMOOdk root@xenon";
in {
  "xenon.cftunnel.age".publicKeys = laurent ++ [xenon];
}
