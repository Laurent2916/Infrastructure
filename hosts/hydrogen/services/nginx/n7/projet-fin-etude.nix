{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "32fe5c7ec6d67241951fdaf001e3da1c41b29dcf"; # pages
    sha256 = "sha256-pOu0lohJ1Yqg/a5hqnNTePTrU8t5By5AbhUAJfL5MBg=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
  tryFiles = "$uri $uri/ /projet-fin-etude/index.html";
}
