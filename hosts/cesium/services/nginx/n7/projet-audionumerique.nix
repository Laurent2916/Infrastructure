{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts."n7.laurent.fainsin.bzh".locations."/projet-audionumerique/" = {
    alias = inputs.projet-audionumerique.packages.${system}.slides + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = "projet-audionumerique";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh/projet-audionumerique/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*Whisper</h1>*)"
      ];
    }
  ];
}
