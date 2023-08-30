{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "193636d2f49e3b190606f1f8f70a9ebe29c7630e"; # pages
    sha256 = "0pjl7c8b2i1g6i4wkcwcsg98a19cssl7l979zhlss778rzn9gdxc";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
