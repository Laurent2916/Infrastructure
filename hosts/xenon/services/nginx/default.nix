{...}: {
  services.nginx = {
    enable = true;
    defaultHTTPListenPort = 8080;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
  };

  imports = [
    ./laurent
    # ./n7
  ];
}
