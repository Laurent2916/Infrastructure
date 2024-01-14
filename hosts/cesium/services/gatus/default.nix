{...}: {
  services.gatus = {
    enable = true;
    configPath = ./config.yml;
  };

  services.nginx = {
    virtualHosts = {
      "status.fainsin.bzh" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://127.0.0.1:2020";
      };
    };
  };
}
