{ modulesPath, pkgs, lib, name, config, ... }:

{
  imports =
    lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix
    ++ [ (modulesPath + "/virtualisation/digital-ocean-config.nix") ];

  networking = {
    hostName = name;
    domain = "fainsin.bzh";
    firewall = {
      allowedTCPPorts = [
        22 # ssh
        80 # http
        443 # https
      ];
      allowedUDPPorts = [
        5553 # wireguard
      ];
      interfaces."wg0".allowedUDPPorts = [
        53 # dns
      ];
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
  };

  networking.nat.enable = true;
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.1/24" ];
      listenPort = 5553;
      privateKeyFile = "/root/wg-private";
      peers = [
        { # pixel
          publicKey = "HS2q+PpPPwxqT1jCD7D4puqr4ZyaXV5TostavlYWBx0=";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        { # neodymium
          publicKey = "IFeRvelEilNRLkhWgFKL9HrJ9XYsm+r4yvv23CigETk=";
          allowedIPs = [ "10.0.0.3/32" ];
        }
      ];
    };
  };

  services.blocky = {
    enable = true;
    settings = {
      upstream.default = [ "208.67.222.222" "208.67.220.220" ];
      clientLookup.clients = {
        hydrogen = [ "10.0.0.1" "127.0.0.1" ];
        pixel5 = [ "10.0.0.2" ];
        neodymium = [ "10.0.0.3" ];
      };
      blocking = {
        refreshPeriod = "24h";
        clientGroupsBlock.default =
          [ "firebog-tick" "firebog-nocross" "regex" ];
        blackLists = {
          firebog-tick = [
            # https://v.firebog.net/hosts/lists.php?type=tick
            "https://adaway.org/hosts.txt"
            "https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt"
            "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt"
            "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
            "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
            "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
            "https://phishing.army/download/phishing_army_blocklist_extended.txt"
            "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
            "https://raw.githubusercontent.com/AssoEchap/stalkerware-indicators/master/generated/hosts"
            "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
            "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
            "https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt"
            "https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
            "https://urlhaus.abuse.ch/downloads/hostfile/"
            "https://v.firebog.net/hosts/AdguardDNS.txt"
            "https://v.firebog.net/hosts/Admiral.txt"
            "https://v.firebog.net/hosts/Easylist.txt"
            "https://v.firebog.net/hosts/Easyprivacy.txt"
            "https://v.firebog.net/hosts/Prigent-Ads.txt"
            "https://v.firebog.net/hosts/Prigent-Crypto.txt"
            "https://v.firebog.net/hosts/RPiList-Malware.txt"
            "https://v.firebog.net/hosts/RPiList-Phishing.txt"
            "https://v.firebog.net/hosts/static/w3kbl.txt"
            "https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser"
          ];
          firebog-nocross = [
            # https://v.firebog.net/hosts/lists.php?type=nocross
            "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt"
            "https://malware-filter.gitlab.io/malware-filter/phishing-filter-hosts.txt"
            "https://paulgb.github.io/BarbBlock/blacklists/hosts-file.txt"
            "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
            "https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/AmazonFireTV.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt"
            "https://raw.githubusercontent.com/RooneyMcNibNug/pihole-stuff/master/SNAFU.txt"
            "https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts"
            "https://someonewhocares.org/hosts/zero/hosts"
            "https://v.firebog.net/hosts/neohostsbasic.txt"
            "https://v.firebog.net/hosts/Prigent-Malware.txt"
            "https://winhelp2002.mvps.org/hosts.txt"
            "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt"
          ];
          regex = [''
            # https://github.com/mmotti/pihole-regex/blob/master/regex.list
            /^ad([sxv]?[0-9]*|system)[_.-]([^.[:space:]]+\\.){1,}|[_.-]ad([sxv]?[0-9]*|system)[_.-]/
            /^(.+[_.-])?adse?rv(er?|ice)?s?[0-9]*[_.-]/
            /^(.+[_.-])?telemetry[_.-]/
            /^adim(age|g)s?[0-9]*[_.-]/
            /^adtrack(er|ing)?[0-9]*[_.-]/
            /^advert(s|is(ing|ements?))?[0-9]*[_.-]/
            /^aff(iliat(es?|ion))?[_.-]/
            /^analytics?[_.-]/
            /^banners?[_.-]/
            /^beacons?[0-9]*[_.-]/
            /^count(ers?)?[0-9]*[_.-]/
            /^mads\\./
            /^pixels?[-.]/
            /^stat(s|istics)?[0-9]*[_.-]/
            /.*\\.g[0-9]+\\..*/
          ''];
        };
      };
    };
  };

  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu"
  ];

  environment.systemPackages = with pkgs; [ htop ];

  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    commonHttpConfig = ''
      log_format vhosts '$host $remote_addr - $remote_user [$time_local] '
                        '$request $status $body_bytes_sent $http_referer '
                        '$http_user_agent $http_x_forwarded_for';
      access_log  /var/log/nginx/access.log vhosts;
    '';

    virtualHosts = {
      "fainsin.bzh" = {
        enableACME = true;
        forceSSL = true;
        locations."/".return =
          ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
      };
      "laurent.fainsin.bzh" = {
        enableACME = true;
        forceSSL = true;
        root = "/srv/www/";
      };
      default = {
        default = true;
        locations."/".return = ''301 "$scheme://fainsin.bzh" '';
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "acme@fainsin.bzh";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
