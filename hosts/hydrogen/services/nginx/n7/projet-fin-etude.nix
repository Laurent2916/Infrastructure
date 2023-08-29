{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "193636d2f49e3b190606f1f8f70a9ebe29c7630e"; # pages
    sha256 = "sha256-rLeX7M/oHK0p/OkkeqjWLAWF0tOMs8lJNC9EsRA7VF4=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
