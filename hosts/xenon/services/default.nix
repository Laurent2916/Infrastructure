{...}: {
  imports = [
    ./atuin.nix
    ./clamav.nix
    ./cloudflared.nix
    ./fail2ban.nix
    ./forgejo.nix
    ./gatus.nix
    # ./immich.nix
    # ./paperless.nix
    ./nginx
    ./ssh.nix
  ];
}
