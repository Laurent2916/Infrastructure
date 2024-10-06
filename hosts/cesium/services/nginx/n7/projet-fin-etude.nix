{
  pkgs,
  vhost,
  location,
  ...
}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-fin-etude-rapport";
    rev = "32fe5c7ec6d67241951fdaf001e3da1c41b29dcf"; # pages
    sha256 = "sha256-pOu0lohJ1Yqg/a5hqnNTePTrU8t5By5AbhUAJfL5MBg=";
  };
in {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = "${pages}/";
    index = "index.html";
    tryFiles = "$uri $uri/ /${location}/index.html";
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
        "[BODY] == pat(*/${location}/assets/index*)"
      ];
    }
  ];
}
