{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-audionumerique";
    rev = "ece8c09f81430c4cc39dddbb1ad7f518f09aaa67"; # pages
    sha256 = "130islkd3jy9vbjm3wnvadamk3n9qqlm8jn7yzywxagjyyrxg0y0";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
