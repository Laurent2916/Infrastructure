{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/TP-calcul-parallele";
    rev = "7222bd269d5f2fb3873cd8cacb83bf5123b1f91a"; # pages
    sha256 = "1anj0xixcql068wijqb344ay1cf8xl7x6mfmbvvcrqv21ni61xx3";
  };
in {
  alias = "${pages}/";
  index = "report.html";
}
