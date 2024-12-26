{...}: {
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      enter_accept = false;
      sync_address = "https://atuin.fainsin.bzh";
      sync_frequency = "5m";
      sync.records = true;
    };
  };

  home.persistence."/persist/home/laurent" = {
    directories = [
      ".ssh"
    ];
  };
}
