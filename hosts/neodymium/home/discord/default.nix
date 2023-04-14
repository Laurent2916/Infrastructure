{ pkgs, ... }:
let
  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "7182b20c7b4fb88b576226009c9d6ac36998aa46";
    sha256 = "03w1qx4gmjdzmzw3jpv51ikaqc2r196szjhb3gn95n90228gbwjf";
  };
in {
  programs.webcord = {
    enable = true;
    themes = {
      CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
    };
  };
}
