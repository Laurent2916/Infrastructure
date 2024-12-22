{config, ...}: {
  age.secrets.cftunnel = {
    file = ../../../secrets/cftunnel.age;
    owner = config.services.cloudflared.user;
    group = config.services.cloudflared.group;
  };
  age.secrets.cfcert = {
    file = ../../../secrets/cfcert.age;
    owner = config.services.cloudflared.user;
    group = config.services.cloudflared.group;
  };

  environment.etc."cloudflared/cert.pem".source = config.age.secrets.cfcert.file;

  services.cloudflared = {
    enable = true;
    tunnels = {
      "xenon" = {
        credentialsFile = config.age.secrets.cftunnel.path;
        default = "http_status:404";
      };
    };
  };
}
