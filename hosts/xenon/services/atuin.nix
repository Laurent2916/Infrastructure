{config, ...}: {
  services.atuin = {
    enable = true;
    openRegistration = false;
    maxHistoryLength = 1000000000;
  };

  services.cloudflared.tunnels."xenon".ingress = {
    "atuin.fainsin.bzh" = {
      service = "http://localhost:${toString config.services.atuin.port}";
    };
  };

  services.gatus.settings.endpoints = [
    {
      name = "atuin.fainsin.bzh";
      group = "services";
      url = "https://atuin.fainsin.bzh";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[CERTIFICATE_EXPIRATION] > 240h"
        "[BODY].homage == pat(*Sir Terry Pratchett*)"
      ];
    }
  ];
}
