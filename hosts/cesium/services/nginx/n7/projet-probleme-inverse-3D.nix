{pkgs, ...}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-probleme-inverse-3D";
    rev = "9c75aadaf1b779e4f88fd42de163dedd8d5e918a"; # pages
    sha256 = "19s8ccvarlps70aqc8njn92sbmmjbpc1d7q08hdb5apghmkplj9f";
  };
in {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-probleme-inverse-3D/" = {
    alias = "${pages}/";
    index = "index.html";
    tryFiles = "$uri $uri/ /projet-probleme-inverse-3D/index.html";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-probleme-inverse-3D";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-probleme-inverse-3D/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*slidevjs/slidev*)"
        "[BODY] == pat(*/projet-probleme-inverse-3D/assets/index*)"
      ];
    }
  ];
}
