{ pkgs, ... }:
let
  pages = pkgs.fetchFromGitea {
    domain = "git.fainsin.bzh";
    owner = "ENSEEIHT";
    repo = "TP-traitement-audio-visuel";
    rev = "0c688cbb74c8b66558c0b9471bad4d0a273eb87a"; # pages
    sha256 = "sha256-qCR2aK54rdXm/+++S7AIVcGZfTsOx7k/Nj8OsDJbyMg=";
  };
in {
  alias = "${pages}/";
  index = "notebook.html";
}
