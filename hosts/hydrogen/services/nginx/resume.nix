{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/resume";
    branchName = "pages";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "c912f223da5440d63e23e6346a672e537dca088f";
    sha256 = "sha256-Ay4JKKcYC5NGlordvIRL8TWmtuEEv7r3XVYbL4W9RR4=";
  };
in {
  services.nginx.virtualHosts = {
    "resume.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = "${pages}/";
          index = "resume.pdf";
        };
      };
    };
  };
}
