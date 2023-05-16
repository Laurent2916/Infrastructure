{ pkgs, ... }:
let
  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "3b6a4a2f69253dc7d5ea93317d7dce9a0ef24589";
    sha256 = "0gzkbbm3q13a77xlsa9zlz846nb05wr9ksra1z1vsvcpqi21gs1s";
  };
in {
  programs.webcord = {
    enable = true;
    themes = {
      CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
    };
  };
}
