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

  # allow swaylock to use pam
  security.pam.services.swaylock = {};
}
