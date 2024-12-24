{config, ...}: {
  services.openssh = {
    enable = true;
    ports = [22];
    settings.PasswordAuthentication = false;
  };

  environment.persistence."/persist".directories = [
    {
      directory = "/etc/ssh";
      user = config.users.users.sshd.name;
      group = config.users.users.sshd.group;
    }
  ];

  services.cloudflared.tunnels."xenon".ingress = {
    "ssh.fainsin.bzh" = {
      service = "ssh://localhost:${builtins.toString (builtins.elemAt config.services.openssh.ports 0)}";
    };
  };
}
