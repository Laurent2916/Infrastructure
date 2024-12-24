{config, ...}: {
  services.paperless = {
    enable = true;
    database.createLocally = true;
    dataDir = "/var/lib/paperless";
  };

  environment.persistence."/persist".directories = [
    {
      directory = config.services.paperless.dataDir;
      user = config.services.paperless.user;
      group = config.services.paperless.user;
    }
  ];
}
