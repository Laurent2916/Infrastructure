{ config, ... }: {
  age.secrets.gitea = {
    file = ../../../../secrets/gitea.age;
    owner = "gitea";
    group = "gitea";
  };
  age.identityPaths = [ "/root/.ssh/id_ed25519" ];

  services.gitea = {
    enable = true;
    domain = "git.fainsin.bzh";
    rootUrl = "https://git.fainsin.bzh";
    lfs.enable = true;
    database = {
      type = "postgres";
      passwordFile = config.age.secrets.gitea.path;
    };
    settings = {
      service = {
        "DEFAULT_KEEP_EMAIL_PRIVATE" = true;
        "DISABLE_REGISTRATION" = true;
      };
      server = { "LANDING_PAGE" = "explore"; };
      indexer = {
        "REPO_INDEXER_ENABLED" = true;
        "REPO_INDEXER_PATH" = "indexers/repos.bleve";
        "UPDATE_BUFFER_LEN" = 20;
        "MAX_FILE_SIZE" = 1048576;
        "REPO_INDEXER_EXCLUDE" = "node_modules/**";
      };
      session = {
        "PROVIDER" = "db";
        "COOKIE_SECURE" = true;
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
}
