{...}: {
  imports = [
    ./nginx
    ./acme.nix
    ./atuin.nix
    ./fail2ban.nix
    ./gatus.nix
    ./forgejo.nix
    ./ssh.nix
  ];
}
