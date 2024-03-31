{...}: {
  programs.ssh = {
    enable = false;

    compression = true;
    addKeysToAgent = "ask";
  };
}
