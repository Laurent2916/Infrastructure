{...}: {
  services.paperless = {
    enable = true;
    database.createLocally = true;
  };
}
