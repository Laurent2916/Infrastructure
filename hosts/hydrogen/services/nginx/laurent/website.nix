{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/personal-website";
    branchName = "pages";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "f256543f9899930381e3e1f60ba6100788ffcb7d"; # pages
    sha256 = "sha256-azKuHweXP8Jtph2gLP2sAvPDymzcg9QRfDAuRcc6nik=";
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
