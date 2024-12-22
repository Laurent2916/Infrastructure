{...}: {
  imports = [
    ./atuin.nix
    ./cloudflared.nix
    ./fail2ban.nix
    ./gatus.nix
    ./ssh.nix
  ];
}
