let
  neodymium =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
in { "borgbackup.age".publicKeys = [ neodymium ]; }
