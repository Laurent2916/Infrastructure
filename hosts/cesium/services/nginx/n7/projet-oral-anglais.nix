{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-oral-anglais/" = {
    alias = inputs.projet-oral-anglais.packages.${system}.slides + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-oral-anglais";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-oral-anglais/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*<title>CAPTCHA</title>*)"
      ];
    }
  ];
}
