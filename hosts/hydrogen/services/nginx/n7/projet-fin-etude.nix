{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "e07d96afbed8fcc8476595f295f262ddc7a1e54c"; # pages
    sha256 = "sha256-emCz7x0/gwnqUbZgL4HmzqVzpwEJGyFHd//NuJgizbQ=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
  tryFiles = "$uri $uri/ /projet-fin-etude/index.html";
}
