{config, ...}: {
  services.forgejo = {
    enable = true;
    lfs.enable = true;
    database = {
      type = "postgres";
      passwordFile = config.age.secrets.gitea.path;
    };
    settings = {
      service = {
        DEFAULT_KEEP_EMAIL_PRIVATE = true;
        DISABLE_REGISTRATION = true;
      };
      server = {
        LANDING_PAGE = "explore";
        ROOT_URL = "https://git.fainsin.bzh";
        DOMAIN = "git.fainsin.bzh";
      };
      indexer = {
        REPO_INDEXER_ENABLED = true;
        REPO_INDEXER_PATH = "indexers/repos.bleve";
        MAX_FILE_SIZE = 1048576;
        REPO_INDEXER_EXCLUDE = "node_modules/**";
      };
      session = {
        PROVIDER = "db";
        COOKIE_SECURE = true;
      };
    };
  };

  services.nginx.virtualHosts."git.fainsin.bzh" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://localhost:3000/";
      proxyWebsockets = true;
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
