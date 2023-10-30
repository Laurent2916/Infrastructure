{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/resume";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "374ea752f30125aeab015a69086b3be183810ba3"; # pages
    sha256 = "sha256-xaIOY486x2Ux/wnC4nGz6YLVFwmbCl1TZG47Lb7Yy0E=";
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
