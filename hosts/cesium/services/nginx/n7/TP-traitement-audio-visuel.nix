{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/TP-traitement-audio-visuel/" = {
    alias = inputs.TP-traitement-audio-visuel.packages.${system}.notebooks + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "TP-traitement-audio-visuel";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/TP-traitement-audio-visuel/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*pluto_notebook*)"
      ];
    }
  ];
}
