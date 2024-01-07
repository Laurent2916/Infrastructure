{...}: {
  network = {
    # the name of the machine
    hostName = "neodymium";

    # domain name servers, use clouflare family
    nameservers = ["1.1.1.2" "1.0.0.2"];

    # use networkManager, see nmcli
    networkmanager.enable = true;

    # firewall
    firewall.enable = true;

    # https://github.com/StevenBlack/hosts
    stevenblack.enable = true;
  };
}
