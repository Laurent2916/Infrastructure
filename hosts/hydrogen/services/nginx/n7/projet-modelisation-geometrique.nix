{pkgs, ...}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-modelisation-geometrique";
    rev = "bf68bccd640e68b92749b0580c82f8ab65e923a8"; # pages
    sha256 = "0f0cn4cbi8ihvnidfyvpn6m2340ljsxq4cbmp29h5drf252w436c";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
