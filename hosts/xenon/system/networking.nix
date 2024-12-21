{...}: {
  networking = {
    # the name of the machine
    hostName = "xenon";

    # the domain used for the machine
    domain = "fainsin.bzh";

    # domain name servers, use clouflare family
    nameservers = ["1.1.1.2" "1.0.0.2"];

    # firewall, all ports closed by default
    firewall.enable = true;

    # Dynamic Host Configuration Protocol (DHCP)
    useDHCP = true;

    # disable IPv6, not used
    enableIPv6 = false;

    # https://github.com/StevenBlack/hosts
    stevenblack.enable = true;
  };
}
