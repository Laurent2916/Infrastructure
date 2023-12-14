{ inputs, system, pkgs, ... }: {
  services.nginx.virtualHosts = {
    "n7.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;

      locations = {

        "/".return = "301 $scheme://git.fainsin.bzh/ENSEEIHT";

      } // {

        "/projet-audionumerique/" = # #
          import ./projet-audionumerique.nix { inherit inputs system; };

        "/projet-systemes-algorithmes-repartis/" = # #
          import ./projet-systemes-algorithmes-repartis.nix pkgs;

        "/projet-intelligence-artificielle-multimedia/" = # #
          import ./projet-intelligence-artificielle-multimedia.nix {
            inherit inputs system;
          };

        "/projet-probleme-inverse-3D/" = # #
          import ./projet-probleme-inverse-3D.nix pkgs;

        "/projet-modelisation-geometrique/" = # #
          import ./projet-modelisation-geometrique.nix pkgs;

        "/projet-long/" = # #
          import ./projet-long.nix pkgs;

        "/projet-oral-japonais/" = # #
          import ./projet-oral-japonais.nix { inherit inputs system; };

        "/projet-oral-anglais/" = # #
          import ./projet-oral-anglais.nix pkgs;

        "/projet-fin-etude/" = # #
          import ./projet-fin-etude.nix pkgs;

      } // {

        "/TP-calcul-parallele/" = # #
          import ./TP-calcul-parallele.nix pkgs;

        "/TP-reinforcement-learning/" = # #
          import ./TP-reinforcement-learning.nix pkgs;

        "/TP-traitement-audio-visuel/" = # #
          import ./TP-traitement-audio-visuel.nix pkgs;

      };
    };
  };
}
