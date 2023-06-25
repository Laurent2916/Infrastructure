{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-audionumerique";
    fetchLFS = true; # https://github.com/go-gitea/gitea/issues/4773
    rev = "ece8c09f81430c4cc39dddbb1ad7f518f09aaa67"; # pages
    sha256 = "130islkd3jy9vbjm3wnvadamk3n9qqlm8jn7yzywxagjyyrxg0y0";
  };
in {
  # "/projet-audionumerique/" = {
  alias = "${pages}/";
  index = "slides.html";
  # };
}
