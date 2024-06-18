{
  pkgs,
  lib,
  ...
}: let
  gcpHost = {
    hostname,
    project,
    zone,
    forwardAgent ? false,
  }: {
    proxyCommand = "${lib.getExe pkgs.python3} -S ${pkgs.google-cloud-sdk}/google-cloud-sdk/lib/gcloud.py compute start-iap-tunnel ${hostname} %p --listen-on-stdin --project ${project} --zone ${zone}";
    forwardAgent = forwardAgent;
    checkHostIP = false;
    identitiesOnly = true;
    extraOptions = {
      StrictHostKeyChecking = "no";
      ProxyUseFdpass = "no";
      UserKnownHostsFile = "~/.ssh/google_compute_known_hosts";
    };
  };
in {
  programs.ssh = {
    enable = true;

    compression = true;
    addKeysToAgent = "ask";

    matchBlocks = {
      "cesium git.fainsin.bzh" = {
        hostname = "fainsin.bzh";
        user = "root";
        port = 624;
      };
      "nicole" = {
        hostname = "3.tcp.eu.ngrok.io";
        user = "laurent";
        port = 25077;
        forwardAgent = true;
      };
      "dataverse51" = gcpHost {
        hostname = "dataverse51";
        project = "genie-training";
        zone = "europe-west1-d";
        forwardAgent = true;
      };
      "laurent-dev-hdd" = gcpHost {
        hostname = "laurent-dev-hdd";
        project = "genie-training";
        zone = "europe-west1-b";
        forwardAgent = true;
      };
      "laurent-dev-l4" = gcpHost {
        hostname = "laurent-dev-l4";
        project = "genie-training";
        zone = "europe-west1-b";
        forwardAgent = true;
      };
      "laurent-dev-a100" = gcpHost {
        hostname = "laurent-dev-a100";
        project = "genie-training";
        zone = "europe-west4-a";
        forwardAgent = true;
      };
    };
  };
}
