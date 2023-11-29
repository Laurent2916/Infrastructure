{ lib, ... }: {
  # the name of the machine
  networking.hostName = "neodymium";

  # domain name servers, use clouflare family
  networking.nameservers = [ "1.1.1.2" "1.0.0.2" ];

  # use networkManager, see nmcli
  networking.networkmanager.enable = true;

  # firewall
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;
}
