{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/personal-website";
    branchName = "pages";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "61ec0c0ad73d21584323eebe38685d60c8851a8d"; # pages
    sha256 = "sha256-dEv36TU3fteObO7cXizh1cHmO+Zxs6LTzbw4plMsp4U=";
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
