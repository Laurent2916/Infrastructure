{...}: {
  services.fail2ban = {
    enable = true;
    maxretry = 3;
    bantime = "10m";
  };
}
