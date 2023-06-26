{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/TP-reinforcement-learning";
    rev = "cfd97e864894af07ba768d8fc9382ddfcc09400f"; # pages
    sha256 = "sha256-yM6XEZHJbhPktPBxG0NGkdoVX3VoZi/sFw4KIvsrclc=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
