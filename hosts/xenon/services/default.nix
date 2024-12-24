{...}: {
  imports = [
    ./atuin.nix
    ./cloudflared.nix
    ./fail2ban.nix
    ./forgejo.nix
    ./gatus.nix
    ./immich.nix
    ./paperless.nix
    ./nginx
    ./ssh.nix
  ];
}
