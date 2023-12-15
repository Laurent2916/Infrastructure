{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      sync_address = "https://atuin.fainsin.bzh";
    };
  };
}
