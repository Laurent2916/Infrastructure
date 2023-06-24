{ pkgs, ... }:
let
  pages = pkgs.fetchFromGitea {
    domain = "git.fainsin.bzh";
    owner = "Laurent";
    repo = "personal-website";
    rev = "pages";
    sha256 = "sha256-ahx9YSKyImQDu7k6/hbgYQdAnw5yInXQ/n14CLWTVkc=";
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
