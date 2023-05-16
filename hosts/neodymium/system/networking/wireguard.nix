{ lib, ... }: {
  networking.wg-quick.interfaces = {
    wg0 = {
      # client
      privateKeyFile = "/root/wireguard-keys/private";
      address = [ "10.0.0.3/24" "fd02:002:002::3/64" ];
      dns = [ "10.0.0.1" ];

      # server
      peers = [{
        publicKey = "y36/EpLUerwM6NSGsVDCkb37Wj/Z3CI0mPFGatVa0Ws=";
        allowedIPs = [ "0.0.0.0/0" "::0/0" ];
        endpoint = "fainsin.bzh:5553";
        persistentKeepalive = 30;
      }];
    };
  };

  # modify the systemd service to restart on failure every 10 seconds
  systemd.services.wg-quick-wg0 = {
    serviceConfig = {
      Type = lib.mkForce "simple";
      Restart = "on-failure";
      RestartSec = "10s";
    };
    unitConfig = {
      # ensures Restart= is always honoured
      StartLimitIntervalSec = 0;
    };
  };
}
