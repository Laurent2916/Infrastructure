{
  config,
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "laurent.fainsin.bzh" = {
      locations."/".root = inputs.website.packages.${system}.default;
    };
    "fainsin.bzh" = {
      locations."/".return = ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
    };
  };

  services.cloudflared.tunnels."xenon".ingress = {
    "laurent.fainsin.bzh" = {
      service = "http://localhost:${config.services.nginx.defaultHTTPListenPort}";
    };
    "fainsin.bzh" = {
      service = "http://localhost:${config.services.nginx.defaultHTTPListenPort}";
    };
  };

  services.gatus.settings.endpoints = [
    {
      name = "fainsin.bzh";
      url = "https://fainsin.bzh";
      interval = "6h";
      conditions = [
        "[DOMAIN_EXPIRATION] > 720h"
      ];
    }
    {
      name = "laurent.fainsin.bzh";
      group = "web";
      url = "https://laurent.fainsin.bzh";
      interval = "5m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*<title>Laurent Fainsin</title>*)"
        "[CERTIFICATE_EXPIRATION] > 240h"
      ];
    }
  ];
}
