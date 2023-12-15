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
}
