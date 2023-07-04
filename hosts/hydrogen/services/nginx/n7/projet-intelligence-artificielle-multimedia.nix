{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url =
      "https://git.fainsin.bzh/ENSEEIHT/projet-intelligence-artificielle-multimedia";
    rev = "8d7708db070170f6f3b276c5ea6f2f1b38e57ee5"; # pages
    sha256 = "07cmnxmhb4l2chb8h9y45jnm10fqlmlq9d7zwllgk6l3gc0m3rdp";
  };
in {
  alias = "${pages}/";
  index = "slides.html";
}
