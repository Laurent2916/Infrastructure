{...}: {
  imports = [
    ./acme
    ./atuin
    ./gatus
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
