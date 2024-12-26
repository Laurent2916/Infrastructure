{...}: {
  services.clamav = {
    daemon.enable = true;
    scanner.enable = true;
  };

  environment.persistence."/persist".directories = [
    {
      directory = "/var/lib/clamav";
      user = "clamav";
      group = "clamav";
    }
  ];
}
