{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/resume";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "ae7d671cca11d6046197dcfd3e1d59a7a3752082"; # pages
    sha256 = "sha256-rnWbT3AYjS6DwXlfoNPFGHZae7yvXoNHRWvHeWceG/M=";
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
