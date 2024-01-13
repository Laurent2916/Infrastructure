{osConfig, ...}: let
  sign_key =
    {
      "silicium" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@silicium";
    }
    ."${osConfig.networking.hostName}";
in {
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Laureηt";
    userEmail = "laurent.git@fainsin.bzh";

    signing = {
      signByDefault = true;
      key = sign_key;
    };

    ignores = [
      ".cache"
      ".DS_Store"
      ".direnv"
      ".venv"
      "node_modules"
      "result"
      "result-*"
    ];

    extraConfig = {
      merge.conflictstyle = "diff3";
    };
  };
}
