{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "7347b714b35910dc1f128a8df2ade953bdad38ec"; # pages
    sha256 = "sha256-bGnkdyVGoIO1HNIr3pCaBJ74Q3LsSlGqY56JEgLP4fY=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
  tryFiles = "$uri $uri/ /projet-fin-etude/index.html";
}
