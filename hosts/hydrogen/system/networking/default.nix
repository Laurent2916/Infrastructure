{...}: {
  networking = {
    # the name of the machine
    hostName = "hydrogen";

    # the domain used for the machine
    domain = "fainsin.bzh";

    # domain name servers, use clouflare family
    nameservers = ["1.1.1.2" "1.0.0.2"];

    # TODO: bouger ça à côté des applications
    firewall = {
      allowedTCPPorts = [
        624 # ssh
        80 # http
        443 # https
      ];
    };
  };
}
