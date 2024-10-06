{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-oral-japonais/" = {
    alias = inputs.projet-oral-japonais.packages.${system}.slides + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-oral-japonais";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-oral-japonais/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*わたしたちのまちは*)"
      ];
    }
  ];
}
