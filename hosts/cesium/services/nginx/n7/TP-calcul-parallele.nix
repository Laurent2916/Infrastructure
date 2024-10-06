{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/TP-calcul-parallele/" = {
    alias = inputs.TP-calcul-parallele.packages.${system}.report + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "TP-calcul-parallele";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/TP-calcul-parallele/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*<title>Benchmarking Distributed GEMM Algorithms</title>*)"
      ];
    }
  ];
}
