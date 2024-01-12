{pkgs, ...}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-probleme-inverse-3D";
    rev = "9c75aadaf1b779e4f88fd42de163dedd8d5e918a"; # pages
    sha256 = "19s8ccvarlps70aqc8njn92sbmmjbpc1d7q08hdb5apghmkplj9f";
  };
in {
  alias = "${pages}/";
  index = "index.html";
  tryFiles = "$uri $uri/ /projet-probleme-inverse-3D/index.html";
}
