{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-modelisation-geometrique";
    rev = "bf68bccd640e68b92749b0580c82f8ab65e923a8"; # pages
    sha256 = "sha256-zAzCRREutwKTuHUxgruWFJAhqrF3e9ei3TCiuBixDDg=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
