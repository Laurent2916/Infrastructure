{config, ...}: {
  age.secrets.cftunnel = {
    file = ../../../secrets/xenon.cftunnel.age;
    owner = config.services.cloudflared.user;
    group = config.services.cloudflared.group;
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "cftunnel" = {
        credentialsFile = config.age.secrets.cftunnel.path;
        default = "http_status:404";
      };
    };
  };
}
