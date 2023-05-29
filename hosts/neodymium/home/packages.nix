{ pkgs, lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-insiders"
      "vscode-extension-github-copilot"
      "vscode-extension-ms-vsliveshare-vsliveshare"
    ];

  services.mpris-proxy.enable = true; # media keys

  home.packages = with pkgs; [
    swaybg # wayland background
    socat # socket cat
    jq # json utils
    baobab # disk utils
    borgbackup # backup
    dconf # required by home-manager
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
    nil # nix language server
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
    webcord-vencord # discord client
    wl-clipboard # clipboard utils
    x2goclient # remote desktop
    xdg-utils
  ];
}
