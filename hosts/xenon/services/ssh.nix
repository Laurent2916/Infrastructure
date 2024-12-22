{
  config,
  builtins,
  ...
}: {
  services.openssh = {
    enable = true;
    ports = [22];
    settings.PasswordAuthentication = false;
  };

  services.cloudflared.tunnels."xenon".ingress = {
    "ssh.fainsin.bzh" = {
      service = "ssh://localhost:${builtins.toString (builtins.elemAt config.services.openssh.ports 0)}";
    };
  };
}
