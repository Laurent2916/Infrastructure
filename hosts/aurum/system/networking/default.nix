{...}: {
  # the name of the machine
  networking.hostName = "aurum";

  # domain name servers, use clouflare family
  networking.nameservers = ["1.1.1.2" "1.0.0.2"];

  # firewall
  networking.firewall.enable = true;

  # https://github.com/StevenBlack/hosts
  networking.stevenblack.enable = true;

  # use networkManager, see nmcli
  networking.networkmanager.enable = true;
  users.users.laurent.extraGroups = ["networkmanager"];
}
