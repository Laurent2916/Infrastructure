{ ... }: {
  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    # disable max body size
    # clientMaxBodySize = "0";
  };

  imports = [ ./laurent ./n7 ];
}
