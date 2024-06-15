{pkgs, ...}: {
  services.mpris-proxy.enable = true; # media keys

  home.packages = with pkgs; [
    bemoji
    alejandra # nix formatter
    borgbackup # backup
    cliphist # clipboard manager
    dconf # required by home-manager
    distrobox # docker utils
    docker-compose # docker compose
    duf # replacement for df
    gnome.nautilus # file explorer
    gnome.seahorse # key manager
    grim # screenshot utils
    jaq # (fast) json utils
    jmtpfs # for Android MTP
    keepassxc # password manager
    nil # nix language server
    pamixer # volume mixer cli
    pavucontrol # volume mixer
    playerctl # media keys
    pwgen # password generator
    rsync # better scp
    slurp # region selector
    socat # socket cat
    sysz # better systemctl
    wl-clipboard # clipboard utils
    xdg-utils
  ];
}
