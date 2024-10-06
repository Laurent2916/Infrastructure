{...}: {
  # enable polkit
  security.polkit.enable = true;

  # RealtimeKit system
  security.rtkit.enable = true;

  # allow swaylock to use pam
  security.pam.services.swaylock = {};

  # enable ssh agent
  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };

  # # ssh-askpass replacement
  # programs.ssh.enableAskPassword = true;
  # programs.seahorse.enable = true;
}
