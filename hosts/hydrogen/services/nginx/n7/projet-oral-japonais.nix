{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-oral-japonais";
    rev = "60fa70fb958c992282dbcff536ebc5d4d7e174a0"; # pages
    sha256 = "1kc6jngpna41zf00i5i1d2wf8sp60w42jwa6xilzprawww0yr17i";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
