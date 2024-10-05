{osConfig, ...}: let
  sign_key =
    {
      "aurum" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIItSJTtS7tO0Wz/WgHAFb3xuNFZpm8SOvr/o8uR83zzy laurent@aurum";
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
      gpg.format = "ssh";
    };
  };
}
