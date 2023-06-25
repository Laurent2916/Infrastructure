{ pkgs, ... }:
let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-long";
    rev = "8290710fa7461c486dc727966c8eaa2234ae2e7d"; # pages
    sha256 = "sha256-Gb/v0YKuxd2F+xOLFNIZcIHWVmzqmbr3QOEc2xwEjPc=";
  };
in {
  alias = "${pages}/";
  index = "index.html";
}
