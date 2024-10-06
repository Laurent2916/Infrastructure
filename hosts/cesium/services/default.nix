{...}: {
  imports = [
    ./nginx
    ./acme.nix
    ./atuin.nix
    ./fail2ban.nix
    ./gatus.nix
    ./gitea.nix
    ./ssh.nix
  ];
}
