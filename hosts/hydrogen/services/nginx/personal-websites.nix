{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/personal-website";
    branchName = "pages";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "4b4f16f32d4e4e8f35071f7260d8f40ff582d094"; # pages
    sha256 = "sha256-BDs7v9r+h20ftEX+Q4M0BAQalm/9QrpGVJVFjVXg9bA=";
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
