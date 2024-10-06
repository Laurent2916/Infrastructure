{...}: {
  services.atuin = {
    enable = true;
    openRegistration = false;
    maxHistoryLength = 1000000000;
  };

  services.nginx = {
    virtualHosts = {
      "atuin.fainsin.bzh" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://127.0.0.1:8888";
      };
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
