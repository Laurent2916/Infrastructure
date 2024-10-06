{pkgs, ...}: {
  services.mpris-proxy.enable = true; # media keys

  home.packages = with pkgs; [
    alejandra # nix formatter
    borgbackup # backup
    dconf # required by home-manager
    distrobox # docker utils
    docker-compose # docker compose
    duf # replacement for df
    nautilus # file explorer
    jaq # (fast) json utils
    jmtpfs # for Android MTP
    keepassxc # password manager
    nil # nix language server
    pavucontrol # volume mixer
    pwgen # password generator
    rsync # better scp
    socat # socket cat
    sysz # tui for systemctl
    xdg-utils
  ];
}
