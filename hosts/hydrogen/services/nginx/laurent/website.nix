{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/personal-website";
    branchName = "pages";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "e29fd08e173268303d47bffbad370ade68ef35d9"; # pages
    sha256 = "sha256-wrHAF+p0Nmly6b24CUbTNUC56r+kakKmBQvOVZqNThY=";
  };
in {
  services.nginx.virtualHosts = {
    "laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      root = "${pages}";
    };
    "fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations."/".return =
        ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
    };
    default = {
      default = true;
      locations."/".return = ''301 "$scheme://fainsin.bzh" '';
    };
  };
}
