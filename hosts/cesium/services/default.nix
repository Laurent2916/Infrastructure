{...}: {
  imports = [
    ./acme
    ./atuin
    ./gitea
    ./nginx
    ./ssh
  ];

  networking.firewall = {
    allowedTCPPorts = [
      80 # http
      443 # https / tls
    ];
  };
}
