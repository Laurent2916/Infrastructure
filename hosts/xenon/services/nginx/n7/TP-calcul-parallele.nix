{
  inputs,
  system,
  location,
  vhost,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = inputs.TP-calcul-parallele.packages.${system}.report + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = location;
      group = vhost;
      url = "https://${vhost}/${location}/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*<title>Benchmarking Distributed GEMM Algorithms</title>*)"
      ];
    }
  ];
}
