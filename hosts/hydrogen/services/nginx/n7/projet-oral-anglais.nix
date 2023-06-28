{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-oral-anglais";
    rev = "4a4404cefdbda12e7ddfcc36c53a2390e4bfc455"; # pages
    sha256 = "sha256-ulZOQcF0Rc/1wSG1j17NHq4gxNkGjncI9ebokPf/+w4=";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
