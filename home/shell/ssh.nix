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
    addKeysToAgent = "yes";
    extraConfig = ''
      SetEnv TERM=xterm-256color
    '';

    matchBlocks = {
      "xenon ssh.fainsin.bzh" = {
        hostname = "ssh.fainsin.bzh";
        user = "root";
        proxyCommand = "${lib.getExe pkgs.cloudflared} access ssh --hostname %h";
      };
      "nicole" = {
        hostname = "3.tcp.eu.ngrok.io";
        user = "laurent";
        port = 25077;
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
      "laurent-dev-cpu" = gcpHost {
        hostname = "laurent-dev-cpu";
        project = "genie-training";
        zone = "europe-west4-a";
        forwardAgent = true;
      };
      "laurent-dev-h100" = gcpHost {
        hostname = "laurent-dev-h100";
        project = "genie-training";
        zone = "europe-west4-b";
        forwardAgent = true;
      };
      "laurent-std-h100" = gcpHost {
        hostname = "laurent-std-h100";
        project = "genie-training";
        zone = "europe-west4-b";
        forwardAgent = true;
      };
    };
  };

  home.persistence."/persist/home/laurent" = {
    directories = [
      ".local/share/atuin"
    ];
  };
}
