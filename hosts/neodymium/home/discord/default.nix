{ pkgs, ... }:
let
  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "b60ff8909af38673ea75831cf513679c3eb94493";
    sha256 = "1xff3kwy6zqn9i83mj2rq65033c34kbxi9qjj7qi7bc1j9ribyxc";
  };
in {
  programs.webcord = {
    enable = true;
    themes = {
      CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
    };
  };
}
