{ ... }: {
  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
  };

  imports = [ ./n7 ./personal-websites.nix ./resume.nix ];
}
