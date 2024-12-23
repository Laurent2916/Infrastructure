{config, ...}: {
  services.forgejo = {
    enable = true;
    lfs.enable = true;
    database.type = "postgres";
    stateDir = "/var/lib/forgejo";
    settings = {
      service = {
        DEFAULT_KEEP_EMAIL_PRIVATE = true;
        DISABLE_REGISTRATION = true;
      };
      server = {
        LANDING_PAGE = "explore";
        ROOT_URL = "https://git.fainsin.bzh";
        DOMAIN = "git.fainsin.bzh";
        SSH_DOMAIN = "ssh.fainsin.bzh";
      };
      indexer = {
        REPO_INDEXER_ENABLED = true;
        REPO_INDEXER_PATH = "indexers/repos.bleve";
        MAX_FILE_SIZE = 1048576; # 1MiB
        REPO_INDEXER_EXCLUDE = "node_modules/**";
      };
      session = {
        PROVIDER = "db";
        COOKIE_SECURE = true;
      };
    };
  };

  environment.persistence."/persist".directories = [
    {
      directory = config.services.forgejo.stateDir;
      user = config.services.forgejo.user;
      group = config.services.forgejo.group;
    }
  ];

  services.cloudflared.tunnels."xenon".ingress = {
    "git.fainsin.bzh" = {
      service = "http://localhost:${toString config.services.forgejo.settings.server.HTTP_PORT}";
    };
  };

  services.gatus.settings.endpoints = [
    {
      name = "git.fainsin.bzh";
      group = "services";
      url = "https://git.fainsin.bzh";
      interval = "5m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[CERTIFICATE_EXPIRATION] > 240h"
        "[BODY] == pat(*<title>Explore - Forgejo: Beyond coding. We Forge.</title>*)"
      ];
    }
  ];
}
