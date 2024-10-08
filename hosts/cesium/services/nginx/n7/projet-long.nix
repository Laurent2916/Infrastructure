{
  pkgs,
  location,
  vhost,
  ...
}: let
  pages = pkgs.fetchgit {
    url = "https://git.fainsin.bzh/ENSEEIHT/projet-long";
    rev = "8290710fa7461c486dc727966c8eaa2234ae2e7d"; # pages
    sha256 = "1xwc0hfdn77183vvm6gadibdd0bh379192qkzf2xvidfhb8yzgqr";
  };
in {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = "${pages}/";
    index = "index.html";
    tryFiles = "$uri $uri/ /projet-long/index.html";
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
        "[BODY] == pat(*/projet-long/assets/index*)"
      ];
    }
  ];
}
