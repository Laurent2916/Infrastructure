{ inputs, pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = false;
  services.mpris-proxy.enable = true;
  home.packages = with pkgs; [
    baobab # disk utils
    borgbackup # backup
    duf # replacement for df
    element-desktop # matrix client
    feh # image viewer
    gnome.nautilus # file explorer
    grim # screenshot utils
    htop # replacement for top
    jmtpfs # for Android MTP
    keepassxc # password manager
    libreoffice-fresh # office suite
    logseq # second brain journalling
    mpv # video viewer
    neovim # text editor
    nixfmt # nix formatter
    pamixer # volume mixer cli
    pavucontrol # volume mixer
    pwgen # password generator
    rsync # better scp
    slurp # region selector
    swayidle # wayland idle hooks
    swaylock # wayland lockscreen
    thunderbird # mail client
    tmux # terminal multiplexer
    waybar # wayland status bar
    wl-clipboard # clipboard utils
    x2goclient # remote desktop
    xdg-utils
  ];
}
