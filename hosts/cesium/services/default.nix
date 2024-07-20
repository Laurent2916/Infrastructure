{...}: {
  imports = [
    ./acme
    ./atuin
    # ./gatus
    ./gitea
    ./nginx
    ./ssh
    ./fail2ban.nix
  ];

  networking.firewall = {
    allowedTCPPorts = [
      80 # http
      443 # https / tls
    ];
  };
}
