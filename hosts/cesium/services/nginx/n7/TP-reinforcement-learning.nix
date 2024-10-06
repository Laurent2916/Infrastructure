{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/TP-reinforcement-learning/" = {
    alias = inputs.TP-reinforcement-learning.packages.${system}.notebooks + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "TP-reinforcement-learning";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/TP-reinforcement-learning/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*pluto_notebook*)"
      ];
    }
  ];
}
