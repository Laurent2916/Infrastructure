{ inputs, pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = false;
  services.mpris-proxy.enable = true;
  home.packages = with pkgs; [
    duf
    tmux
    htop
    rsync
    pwgen
    neovim

    dconf
    xdg-utils

    baobab
    pavucontrol

    grim
    mako
    slurp
    waybar
    pamixer
    swayidle
    swaylock
    wl-clipboard

    nixfmt

    borgbackup

    gnome.nautilus
    jmtpfs

    mpv
    feh
    keepassxc
    x2goclient
    thunderbird
    element-desktop
    libreoffice-fresh
  ];
}
