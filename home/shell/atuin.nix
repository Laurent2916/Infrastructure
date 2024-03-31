{...}: {
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      enter_accept = false;
      sync_address = "https://atuin.fainsin.bzh";
    };
  };
}
