{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = inputs.website.packages.${system}.default;
        };
      };
    };
    "fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations."/".return = ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
    };
    default = {
      default = true;
      locations."/".return = ''301 "$scheme://laurent.fainsin.bzh" '';
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
