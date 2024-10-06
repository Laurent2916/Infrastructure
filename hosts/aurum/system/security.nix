{pkgs, ...}: {
  # enable polkit
  security.polkit.enable = true;

  # enable gpg agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  # secrets keyring
  services.gnome.gnome-keyring.enable = true;

  # seahorse secret manager
  programs.seahorse.enable = true;

  # RealtimeKit system
  security.rtkit.enable = true;

  # allow swaylock to use pam
  security.pam.services.swaylock = {};
}
