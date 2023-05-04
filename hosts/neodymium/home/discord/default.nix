{ pkgs, ... }:
let
  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "10a829f9c24a84ede8cedeed488a767369ac1ea7";
    sha256 = "133404n08gzvjw07kaw4azzzp41hdl9k4wqsvn2786sgpbwlr2av";
  };
in {
  programs.webcord = {
    enable = true;
    themes = {
      CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
    };
  };
}
