{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-modelisation-geometrique/" = {
    alias = inputs.projet-modelisation-geometrique.packages.${system}.report + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-modelisation-geometrique";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-modelisation-geometrique/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*Projet de Modélisation Géométrique*)"
      ];
    }
  ];
}
