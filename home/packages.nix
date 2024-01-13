{pkgs, ...}: {
  services.mpris-proxy.enable = true; # media keys

  home.packages = with pkgs; [
    (bemoji.overrideAttrs (_: {
      src = pkgs.fetchFromGitHub {
        owner = "marty-oehme";
        repo = "bemoji";
        rev = "74af60c3f7d5be24dd584214dcec7ed4b71a926c";
        hash = "sha256-Yw5TAC/j1njctamXN4OrD+sl4tVOuWu1qL7d0B5gBWw=";
      };
    }))
    borgbackup # backup
    dconf # required by home-manager
    distrobox # docker utils
    docker-compose # docker compose
    duf # replacement for df
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
    alejandra # nix formatter
    pamixer # volume mixer cli
    pavucontrol # volume mixer
    pwgen # password generator
    rsync # better scp
    slurp # region selector
    socat # socket cat
    thunderbird # mail client
    tmux # terminal multiplexer
    cliphist # clipboard manager
    wl-clipboard # clipboard utils
    xdg-utils
    sysz # better systemctl
  ];
}
