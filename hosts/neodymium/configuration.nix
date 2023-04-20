{ config, pkgs, lib, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # networking
  networking.hostName = "neodymium";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # wireguard vpn
  networking.wg-quick.interfaces = {
    wg0 = {
      privateKeyFile = "/root/wireguard-keys/private";
      address = [ "10.0.0.3/32" ];
      dns = [ "10.0.0.1" ];
      peers = [{
        publicKey = "y36/EpLUerwM6NSGsVDCkb37Wj/Z3CI0mPFGatVa0Ws=";
        allowedIPs = [ "10.0.0.1/24" ];
        endpoint = "fainsin.bzh:5553";
      }];
    };
  };

  # use bootspec
  boot.bootspec.enable = true;

  # use systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable NTFS disk mounting
  boot.supportedFilesystems = [ "ntfs" ];

  # clean /tmp at each boot
  boot.tmp.cleanOnBoot = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # restrict nix command to sudoers
  nix.settings.allowed-users = [ "@wheel" ];

  # hardware
  hardware = {
    enableRedistributableFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  # logind configuration
  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=suspend
    '';
  };

  services.tlp.enable = true;

  # internationalisation
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_DK.UTF-8";
  console.keyMap = "fr";

  # fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-extra
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # udev
  services.udev.packages = [ pkgs.android-udev-rules ];

  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };

  programs.light.enable = true;

  users.mutableUsers = false;
  users.users.laurent = {
    isNormalUser = true;
    initialPassword = "laurent";
    extraGroups = [ "wheel" "video" "docker" "adbusers" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  home-manager = { users.laurent = ./home; };

  # enable docker
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    enableOnBoot = false;
    autoPrune.enable = true;
  };

  # enable gnome virtual file system
  services.gvfs.enable = true;

  # enable ssh agent
  programs.ssh.startAgent = true;

  # enable polkit
  security.polkit.enable = true;

  # allow swaylock to use pam
  security.pam.services.swaylock = { };

  # enable unfree
  nixpkgs.config.allowUnfree = true;

  # experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # optimizations
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  age.secrets.borgbackup = {
    file = "/home/laurent/infrastructure/secrets/borgbackup.age";
    owner = "laurent";
    group = "users";
  };
  age.identityPaths = [ "/home/laurent/.ssh/id_ed25519" ];

  services.borgbackup.jobs.home = {
    paths = "/home/laurent/";
    repo = "/mnt/home_backup";
    exclude = [
      # Largest cache dirs
      ".cache"
      ".compose-cache"
      "*/cache"
      "*/cache2" # firefox
      "*/Cache"
      "*/Code Cache"
      ".config/Slack/logs"
      ".config/Code/CachedData"
      ".container-diff"
      ".npm/_cacache"
      # Work related dirs
      "*/node_modules"
      "*/bower_components"
      "*/build"
      "*/_build"
      "*/.tox"
      "*/venv"
      "*/.venv"
    ];
    encryption = {
      mode = "repokey";
      passCommand = "cat ${config.age.secrets.borgbackup.path}";
    };
    compression = "auto,zstd";
    startAt = [ ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
