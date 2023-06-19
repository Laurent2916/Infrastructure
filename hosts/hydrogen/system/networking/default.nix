{ ... }: {
  networking = {
    hostName = "hydrogen";
    domain = "fainsin.bzh";
    firewall = {
      allowedTCPPorts = [
        22 # ssh
        80 # http
        443 # https
      ];
    };
  };
}
