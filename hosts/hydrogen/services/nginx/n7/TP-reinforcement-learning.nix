{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/TP-reinforcement-learning";
    rev = "cfd97e864894af07ba768d8fc9382ddfcc09400f"; # pages
    sha256 = "0mvj5gxj42hf2zn2yrk8fmgibnli8r1inwghnkj16vn9j48rgkn8";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
