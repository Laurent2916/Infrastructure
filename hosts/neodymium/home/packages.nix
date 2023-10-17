{ pkgs, ... }: {
  services.mpris-proxy.enable = true; # media keys

  home.packages = with pkgs; [
    borgbackup # backup
    dconf # required by home-manager
    distrobox # podman wrapper
    podman-compose # "docker" compose
    duf # replacement for df
    element-desktop # matrix client
    feh # image viewer
    gnome.nautilus # file explorer
    grim # screenshot utils
    jaq # (fast) json utils
    jmtpfs # for Android MTP
    keepassxc # password manager
    obsidian # second brain journalling
    micro # text editor
    mpv # video viewer
    nil # nix language server
    nixfmt # nix formatter
    pamixer # volume mixer cli
    pavucontrol # volume mixer
    pwgen # password generator
    rsync # better scp
    slurp # region selector
    socat # socket cat
    thunderbird # mail client
    tmux # terminal multiplexer
    webcord-vencord # discord client
    cliphist # clipboard manager
    wl-clipboard # clipboard utils
    xdg-utils
    sysz # better systemctl
  ];
}
