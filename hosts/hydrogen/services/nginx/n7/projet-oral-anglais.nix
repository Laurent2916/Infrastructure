{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-oral-anglais";
    rev = "4a4404cefdbda12e7ddfcc36c53a2390e4bfc455"; # pages
    sha256 = "03pvzzvr1s76yl47g3h6v7221bhyrmg8zd91q7swyiblq50lwmms";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
