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
    obsidian # second brain journalling
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
