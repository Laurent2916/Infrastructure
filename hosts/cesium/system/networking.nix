{...}: {
  networking = {
    # the name of the machine
    hostName = "cesium";

    # the domain used for the machine
    domain = "fainsin.bzh";

    # domain name servers, use clouflare family
    nameservers = ["1.1.1.2" "1.0.0.2"];

    # firewall
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80 # http
        443 # tls
      ];
    };

    # https://github.com/StevenBlack/hosts
    stevenblack.enable = true;
  };
}
