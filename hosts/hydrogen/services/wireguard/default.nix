{ ... }: {
  networking = {
    firewall = {
      allowedUDPPorts = [
        5553 # wireguard
      ];
    };

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "ens3";
      internalInterfaces = [ "wg0" ];
    };

    wireguard.interfaces = {
      wg0 = {
        ips = [ "10.0.0.1/24" "fd02:002:002::1/64" ];
        listenPort = 5553;
        privateKeyFile = "/root/wg-private";
        peers = [
          { # pixel
            publicKey = "HS2q+PpPPwxqT1jCD7D4puqr4ZyaXV5TostavlYWBx0=";
            allowedIPs = [ "10.0.0.2/32" "fd02:002:002::2/64" ];
          }
          { # neodymium
            publicKey = "IFeRvelEilNRLkhWgFKL9HrJ9XYsm+r4yvv23CigETk=";
            allowedIPs = [ "10.0.0.3/32" "fd02:002:002::3/64" ];
          }
        ];
      };
    };
  };
}
