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
        REGISTER_MANUAL_CONFIRM = true;
      };
      server = {
        LANDING_PAGE = "explore";
        ROOT_URL = "https://git.fainsin.bzh";
        DOMAIN = "git.fainsin.bzh";
        SSH_DOMAIN = "ssh.fainsin.bzh";
      };
      indexer = {
        REPO_INDEXER_ENABLED = true;
        MAX_FILE_SIZE = 1048576; # 1MiB
        REPO_INDEXER_EXCLUDE = "result/**,node_modules/**";
      };
      security = {
        INSTALL_LOCK = true;
        MIN_PASSWORD_LENGTH = 20;
        PASSWORD_COMPLEXITY = "lower,upper,digit";
      };
      session = {
        PROVIDER = "db";
        COOKIE_SECURE = true;
      };
      cron = {
        ENABLED = true;
      };
      "cron.delete_old_system_notices" = {
        ENABLED = true;
      };
      "cron.delete_missing_repos" = {
        ENABLED = true;
      };
      "cron.delete_old_actions" = {
        ENABLED = true;
      };
      "cron.gc_lfs" = {
        ENABLED = true;
      };
      oauth2 = {
        ENABLED = false;
      };
      other = {
        SHOW_FOOTER_BRANDING = false;
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
