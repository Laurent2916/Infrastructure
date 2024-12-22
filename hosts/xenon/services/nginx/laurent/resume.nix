{
  inputs,
  system,
  config,
  ...
}: {
  services.nginx.virtualHosts = {
    "resume.laurent.fainsin.bzh" = {
      locations = {
        "/" = {
          root = inputs.resume.packages.${system}.default;
          index = "resume.pdf";
        };
      };
    };
  };

  services.cloudflared.tunnels."xenon".ingress = {
    "resume.laurent.fainsin.bzh" = {
      service = "http://localhost:${toString config.services.nginx.defaultHTTPListenPort}";
    };
  };

  services.gatus.settings.endpoints = [
    {
      name = "resume.laurent.fainsin.bzh";
      group = "web";
      url = "https://resume.laurent.fainsin.bzh";
      interval = "5m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[CERTIFICATE_EXPIRATION] > 240h"
      ];
    }
  ];
}
