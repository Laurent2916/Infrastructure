{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/resume";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "57134888a29bc56e4ca3a2507d4e3b728619948f"; # pages
    sha256 = "0prm5j39dz5lp2bafqyh1mb7045h0csb4k42m92yy0m88pfk1m5x";
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
