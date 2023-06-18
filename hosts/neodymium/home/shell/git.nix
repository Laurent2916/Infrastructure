{ ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Laureηt";
    userEmail = "laurent@fainsin.bzh";
    signing = {
      signByDefault = true;
      key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
    };
  };
}
