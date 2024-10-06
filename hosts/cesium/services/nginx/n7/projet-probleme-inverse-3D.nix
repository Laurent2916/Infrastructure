{
  pkgs,
  location,
  vhost,
  ...
}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-probleme-inverse-3D";
    rev = "9c75aadaf1b779e4f88fd42de163dedd8d5e918a"; # pages
    sha256 = "19s8ccvarlps70aqc8njn92sbmmjbpc1d7q08hdb5apghmkplj9f";
  };
in {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = "${pages}/";
    index = "index.html";
    tryFiles = "$uri $uri/ /projet-probleme-inverse-3D/index.html";
  };

  services.gatus.settings.endpoints = [
    {
      name = location;
      group = vhost;
      url = "https://${vhost}/${location}/";
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
