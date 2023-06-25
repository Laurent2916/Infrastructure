{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url =
      "https://git.fainsin.bzh/ENSEEIHT/projet-systemes-algorithmes-repartis";
    rev = "1826a53d95b19400b8dd252cd05b20012e3c3dac"; # pages
    sha256 = "0n81hpcj7lj5i7jhl8af869vy6fp6bhyrk4fdl6y2rpjgp64zmq2";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
