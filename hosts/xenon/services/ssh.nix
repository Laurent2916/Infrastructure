{...}: {
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    ports = [624];
  };
}
