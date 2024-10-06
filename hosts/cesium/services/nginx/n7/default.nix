{...}: {
  services.nginx.virtualHosts = {
    "n7.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;

      locations."/".return = "301 $scheme://git.fainsin.bzh/ENSEEIHT";
    };
  };

  imports = [
    ./projet-audionumerique.nix
    ./projet-fin-etude.nix
    ./projet-intelligence-artificielle-multimedia.nix
    ./projet-long.nix
    ./projet-modelisation-geometrique.nix
    ./projet-oral-anglais.nix
    ./projet-oral-japonais.nix
    ./projet-probleme-inverse-3D.nix
    ./projet-systemes-algorithmes-repartis.nix
    ./TP-calcul-parallele.nix
    ./TP-reinforcement-learning.nix
    ./TP-traitement-audio-visuel.nix
  ];

  services.gatus.settings.endpoints = [
    {
      name = "n7.laurent.fainsin.bzh";
      group = "n7.laurent.fainsin.bzh";
      url = "https://n7.laurent.fainsin.bzh";
      interval = "15m";
      conditions = [
        "[CERTIFICATE_EXPIRATION] > 240h"
      ];
    }
  ];
}
