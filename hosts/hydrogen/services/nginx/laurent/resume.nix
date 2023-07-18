{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/Laurent/resume";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "49e55df24a9de37fb439f60140b677178c458bd3"; # pages
    sha256 = "sha256-htb6jdeaZeoVUBXw5hiQ9K57cmw5qOE57vIGfxNLcPk=";
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
