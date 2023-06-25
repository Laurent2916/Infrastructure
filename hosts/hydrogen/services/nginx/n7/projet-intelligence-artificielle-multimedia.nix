{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url =
      "https://git.fainsin.bzh/ENSEEIHT/projet-intelligence-artificielle-multimedia";
    rev = "a32c0ec1d010ee8f183fed35169a8e6a92282e28"; # pages
    sha256 = "1lrlnqnglkmqspvaphv9wz7d9wl26jkx2pn45b5793xds0w32vsk";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
