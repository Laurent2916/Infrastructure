{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-oral-japonais";
    rev = "60fa70fb958c992282dbcff536ebc5d4d7e174a0"; # pages
    sha256 = "sha256-8YTsAedc5ftp7EZxKQgH5mrkuGghlgiA+4Eoe5+Vhs0=";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
