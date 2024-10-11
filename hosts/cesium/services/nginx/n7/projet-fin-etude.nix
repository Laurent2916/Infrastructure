{
  inputs,
  system,
  vhost,
  location,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations = {
    "/${location}/" = {
      alias = inputs.projet-fin-etude.packages.${system}.slides + "/";
      tryFiles = "$uri $uri/ /${location}/index.html";
    };
    "=/${location}/rapport.pdf" = {
      alias = inputs.projet-fin-etude.packages.${system}.report + "/paper.pdf";
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
        "[BODY] == pat(*/${location}/assets/index*)"
      ];
    }
  ];
}
