{ ... }: {
  # set hostname
  networking.hostName = "neodymium";

  # use networkManager, see nmcli
  networking.networkmanager.enable = true;

  # firewall
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  imports = [ ./wireguard.nix ];
}
