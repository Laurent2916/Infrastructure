{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "laurent.fainsin.bzh" = {
      locations = {
        "/resume.pdf" = {
          root = inputs.resume.packages.${system}.default;
          index = "resume.pdf";
        };
      };
    };
  };

  services.gatus.settings.endpoints = [
    {
      name = "laurent.fainsin.bzh/resume";
      group = "web";
      url = "https://laurent.fainsin.bzh/resume.pdf";
      interval = "5m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[CERTIFICATE_EXPIRATION] > 240h"
      ];
    }
  ];
}
