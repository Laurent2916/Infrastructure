{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-intelligence-artificielle-multimedia/" = {
    alias =
      inputs.projet-intelligence-artificielle-multimedia.packages.${system}.slides
      + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-intelligence-artificielle-multimedia";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-intelligence-artificielle-multimedia/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*Projet IAM*)"
      ];
    }
  ];
}
