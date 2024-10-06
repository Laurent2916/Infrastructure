{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-systemes-algorithmes-repartis/" = {
    alias = inputs.projet-systemes-algorithmes-repartis.packages.${system}.slides + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-systemes-algorithmes-repartis";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-systemes-algorithmes-repartis/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*The RAFT Consensus Algorithm*)"
      ];
    }
  ];
}
