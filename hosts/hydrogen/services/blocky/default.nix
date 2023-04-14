{ ... }: {
  networking = {
    firewall = {
      # allow dns queries trough wireguard
      interfaces."wg0".allowedUDPPorts = [
        53 # dns default port
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
          regex = [
            # https://github.com/mmotti/pihole-regex/blob/master/regex.list
            ''
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
            ''
          ];
        };
      };
    };
  };
}
