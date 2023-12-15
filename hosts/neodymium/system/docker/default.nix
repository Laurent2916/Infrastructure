{...}: {
  virtualisation.podman = {
    enable = true;

    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled =
      true; # required by networks in compose
    autoPrune.enable = true;
  };
}
