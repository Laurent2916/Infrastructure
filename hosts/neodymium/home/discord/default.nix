{ pkgs, ... }:
let
  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "be898e83d7bbf6eed94e3edca09cd68786e06c2a";
    sha256 = "1a2czbhcwagygihhscrzqy4argsqrcdcjjgdrscp3ip5619k9mxn";
  };
in {
  programs.webcord = {
    enable = true;
    themes = {
      CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
    };
  };
}
