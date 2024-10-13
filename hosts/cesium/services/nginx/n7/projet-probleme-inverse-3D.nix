{
  inputs,
  system,
  location,
  vhost,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = inputs.projet-probleme-inverse-3D.packages.${system}.slides + "/";
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
        "[BODY] == pat(*/projet-probleme-inverse-3D/assets/index*)"
      ];
    }
  ];
}
