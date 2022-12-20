{modulesPath, pkgs, lib, name, config, ... }:

{
  imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
    (modulesPath + "/virtualisation/digital-ocean-config.nix")
  ];

  networking = {
    hostName = name;
    domain = "fainsin.bzh";
    firewall.allowedTCPPorts = [
    22    # ssh
    80    # http
    443   # https
    ];
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
  };

  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu"
  ];

  environment.systemPackages = with pkgs; [
    htop
  ];

  services.nginx = {
    enable = true;

    # recommendedTlsSettings = true;
    # recommendedOptimisation = true;
    # recommendedGzipSettings = true;
    # recommendedProxySettings = true;

    # commonHttpConfig = ''
    # log_format vhosts '$host $remote_addr - $remote_user [$time_local] '
    #                 "$request" $status $body_bytes_sent "$http_referer" '
    #                 '"$http_user_agent" "$http_x_forwarded_for"';

    # access_log  /var/log/nginx/access.log vhosts;
    # '';

    virtualHosts = {
    "fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations."/".return = "301 \"$scheme://laurent.fainsin.bzh$request_uri\"";
    };
    "laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/";
    };
    default = {
      default = true;
      locations."/".return = "301 \"$scheme://fainsin.bzh\" ";
    };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs = {
      "fainsin.bzh".email = "acme@fainsin.bzh";
      "laurent.fainsin.bzh".email = "acme@fainsin.bzh";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}