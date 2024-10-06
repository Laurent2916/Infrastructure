{
  pkgs,
  inputs,
  system,
  ...
}: let
  vhost = "n7.laurent.fainsin.bzh";
  withLocation = location: {inherit inputs pkgs system vhost location;};
in {
  services.nginx.virtualHosts = {
    ${vhost} = {
      enableACME = true;
      forceSSL = true;

      locations."/".return = "301 $scheme://git.fainsin.bzh/ENSEEIHT";
    };
  };

  imports = [
    (import ./projet-audionumerique.nix (withLocation "projet-audionumerique"))
    (import ./projet-fin-etude.nix (withLocation "projet-fin-etude"))
    (import ./projet-intelligence-artificielle-multimedia.nix (withLocation "projet-intelligence-artificielle-multimedia"))
    (import ./projet-long.nix (withLocation "projet-long"))
    (import ./projet-modelisation-geometrique.nix (withLocation "projet-modelisation-geometrique"))
    (import ./projet-oral-anglais.nix (withLocation "projet-oral-anglais"))
    (import ./projet-oral-japonais.nix (withLocation "projet-oral-japonais"))
    (import ./projet-probleme-inverse-3D.nix (withLocation "projet-probleme-inverse-3D"))
    (import ./projet-systemes-algorithmes-repartis.nix (withLocation "projet-systemes-algorithmes-repartis"))
    (import ./TP-calcul-parallele.nix (withLocation "TP-calcul-parallele"))
    (import ./TP-reinforcement-learning.nix (withLocation "TP-reinforcement-learning"))
    (import ./TP-traitement-audio-visuel.nix (withLocation "TP-traitement-audio-visuel"))
  ];

  services.gatus.settings.endpoints = [
    {
      name = vhost;
      group = vhost;
      url = "https://${vhost}";
      interval = "15m";
      conditions = [
        "[CERTIFICATE_EXPIRATION] > 240h"
      ];
    }
  ];
}
