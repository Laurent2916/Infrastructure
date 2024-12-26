{
  inputs,
  system,
  vhost,
  location,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations = {
    "/${location}/" = {
      alias = inputs.projet-long.packages.${system}.slides + "/";
      tryFiles = "$uri $uri/ /${location}/index.html";
    };
    "=/${location}/rapport.pdf" = {
      alias = inputs.projet-long.packages.${system}.report + "/paper.pdf";
    };
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
