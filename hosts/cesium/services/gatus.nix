{...}: {
  services.gatus = {
    enable = true;

    settings = {
      web.port = 2020;

      endpoints = [
        {
          name = "fainsin.bzh";
          url = "https://fainsin.bzh";
          interval = "6h";
          conditions = [
            "[DOMAIN_EXPIRATION] > 720h"
          ];
        }
        {
          name = "laurent.fainsin.bzh";
          group = "web";
          url = "https://laurent.fainsin.bzh";
          interval = "5m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*<title>Laurent Fainsin</title>*)"
            "[CERTIFICATE_EXPIRATION] > 240h"
          ];
        }
        {
          name = "resume.laurent.fainsin.bzh";
          group = "web";
          url = "https://resume.laurent.fainsin.bzh";
          interval = "5m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[CERTIFICATE_EXPIRATION] > 240h"
          ];
        }
        {
          name = "git.fainsin.bzh";
          group = "services";
          url = "https://git.fainsin.bzh";
          interval = "5m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[CERTIFICATE_EXPIRATION] > 240h"
            "[BODY] == pat(*<title>Explore - Forgejo: Beyond coding. We Forge.</title>*)"
          ];
        }
        {
          name = "atuin.fainsin.bzh";
          group = "services";
          url = "https://atuin.fainsin.bzh";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[CERTIFICATE_EXPIRATION] > 240h"
            "[BODY].homage == pat(*Sir Terry Pratchett*)"
          ];
        }
        {
          name = "status.fainsin.bzh";
          group = "services";
          url = "https://status.fainsin.bzh";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[CERTIFICATE_EXPIRATION] > 240h"
            "[BODY] == pat(*<title>Health Dashboard | Gatus</title>*)"
          ];
        }
        {
          name = "n7.laurent.fainsin.bzh";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh";
          interval = "15m";
          conditions = [
            "[CERTIFICATE_EXPIRATION] > 240h"
          ];
        }
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
        {
          name = "projet-systemes-algorithmes-repartis";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh/projet-systemes-algorithmes-repartis/";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*The RAFT Consensus Algorithm*)"
          ];
        }
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
        {
          name = "projet-probleme-inverse-3D";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh/projet-probleme-inverse-3D/";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*slidevjs/slidev*)"
            "[BODY] == pat(*/projet-probleme-inverse-3D/assets/index*)"
          ];
        }
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
        {
          name = "projet-long";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh/projet-long/";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*slidevjs/slidev*)"
            "[BODY] == pat(*/projet-long/assets/index*)"
          ];
        }
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
        {
          name = "projet-fin-etude";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh/projet-fin-etude/";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*slidevjs/slidev*)"
            "[BODY] == pat(*/projet-fin-etude/assets/index*)"
          ];
        }
        {
          name = "TP-calcul-parallele";
          group = "n7.laurent.fainsin.bzh";
          url = "https://n7.laurent.fainsin.bzh/TP-calcul-parallele/";
          interval = "15m";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 300"
            "[BODY] == pat(*<title>Benchmarking Distributed GEMM Algorithms</title>*)"
          ];
        }
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
    };
  };

  services.nginx = {
    virtualHosts = {
      "status.fainsin.bzh" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://127.0.0.1:2020";
      };
    };
  };
}
