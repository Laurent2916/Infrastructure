{...}: {
  services.gatus = {
    enable = true;

    settings = {
      web.port = 2020;

      endpoints = [
        {
          name = "status.fainsin.bzh";
          group = "services";
          url = "https://status.fainsin.bzh";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[CERTIFICATE_EXPIRATION] > 240h"
            "[BODY] == pat(*<title>Health Dashboard | Gatus</title>*)"
          ];
        }
      ];
    };
  };

  services.cloudflared = {
    tunnels = {
      "cftunnel" = {
        ingress = {
          "status.fainsin.bzh" = {
            service = "http://localhost:2020";
          };
        };
      };
    };
  };
}
