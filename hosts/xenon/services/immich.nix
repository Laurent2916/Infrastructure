{config, ...}: {
  services.immich = {
    enable = true;
    mediaLocation = "/var/lib/immich";
  };

  environment.persistence."/persist".directories = [
    {
      directory = config.services.immich.mediaLocation;
      user = config.services.immich.user;
      group = config.services.immich.group;
    }
  ];
}
