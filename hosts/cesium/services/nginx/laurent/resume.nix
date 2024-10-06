{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "resume.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = inputs.resume.packages.${system}.default;
          index = "resume.pdf";
        };
      };
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
