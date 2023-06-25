{ ... }: {
  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
  };

  imports = [ ./laurent ./n7 ];
}
