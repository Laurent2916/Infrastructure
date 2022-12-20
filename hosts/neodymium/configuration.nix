# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.hostName = "neodymium";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableRedistributableFirmware = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IE.UTF-8";
  console = {
    keyMap = "fr";
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.light.enable = true;

  users.mutableUsers = false;
  users.users.laurent = {
    isNormalUser = true;
    initialPassword = "laurent";
    extraGroups = [ "wheel" "video" ];
  };
  home-manager.users.laurent = {
    home.stateVersion = "22.11";
    home.packages = with pkgs; [
      exa
      bat
      tmux
      htop
      rsync
      pwgen
      neovim
      
      baobab
      alacritty
      pavucontrol

      swaylock
      swayidle
      wl-clipboard
      waybar
      slurp
      grim
      mako

      mpv
      feh
      vscode
      librewolf
      keepassxc
      x2goclient
      thunderbird
      element-desktop
    ];

    programs.git = {
      enable = true;
      userName = "Laureηt";
      userEmail = "laurent@fainsin.bzh";
      signing = {
        signByDefault = true;
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
      };
    };

    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
        terminal = "alacritty";
        input = {
          "type:touchpad" = {
            dwt = "disable";
            tap = "enabled";
            natural_scroll = "disabled";
            middle_emulation = "enabled";
          };
          "type:keyboard" = {
            xkb_numlock = "enabled";
            xkb_layout = "fr";
          };
        };
        output = {
          "*" = {
            bg = "~/Pictures/wallpapers/kai-oberhauser-unsplash.jpg fill";
          };
        };
        bars = [
          {command = "${pkgs.waybar}/bin/waybar";}
        ];
        keybindings = {
          # Start a terminal
          "${modifier}+Return" = "exec ${terminal}";
          # Switch to workspace
          "${modifier}+ampersand" = "workspace 1";
          "${modifier}+eacute" = "workspace 2";
          "${modifier}+quotedbl" = "workspace 3";
          "${modifier}+apostrophe" = "workspace 4";
          "${modifier}+parenleft" = "workspace 5";
          "${modifier}+minus" = "workspace 6";
          "${modifier}+egrave" = "workspace 7";
          "${modifier}+underscore" = "workspace 8";
          "${modifier}+ccedilla" = "workspace 9";
          "${modifier}+agrave" = "workspace 10";
          "${modifier}+KP_1" = "workspace 11";
          "${modifier}+KP_2" = "workspace 12";
          "${modifier}+KP_3" = "workspace 13";
          "${modifier}+KP_4" = "workspace 14";
          "${modifier}+KP_5" = "workspace 15";
          "${modifier}+KP_6" = "workspace 16";
          "${modifier}+KP_7" = "workspace 17";
          "${modifier}+KP_8" = "workspace 18";
          "${modifier}+KP_9" = "workspace 19";
          "${modifier}+KP_0" = "workspace 20";
          "${modifier}+KP_End" = "workspace 11";
          "${modifier}+KP_Down" = "workspace 12";
          "${modifier}+KP_Next" = "workspace 13";
          "${modifier}+KP_Left" = "workspace 14";
          "${modifier}+KP_Begin" = "workspace 15";
          "${modifier}+KP_Right" = "workspace 16";
          "${modifier}+KP_Home" = "workspace 17";
          "${modifier}+KP_Up" = "workspace 18";
          "${modifier}+KP_Prior" = "workspace 19";
          "${modifier}+KP_Insert" = "workspace 20";
          # Move focused container to workspace
          "${modifier}+Shift+ampersand" = "move container to workspace number 1";
          "${modifier}+Shift+eacute" = "move container to workspace number 2";
          "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
          "${modifier}+Shift+apostrophe" = "move container to workspace number 4";
          "${modifier}+Shift+parenleft" = "move container to workspace number 5";
          "${modifier}+Shift+minus" = "move container to workspace number 6";
          "${modifier}+Shift+egrave" = "move container to workspace number 7";
          "${modifier}+Shift+underscore" = "move container to workspace number 8";
          "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
          "${modifier}+Shift+agrave" = "move container to workspace number 10";
          "${modifier}+Shift+KP_End" = "move container to workspace number 11";
          "${modifier}+Shift+KP_Down" = "move container to workspace number 12";
          "${modifier}+Shift+KP_Next" = "move container to workspace number 13";
          "${modifier}+Shift+KP_Left" = "move container to workspace number 14";
          "${modifier}+Shift+KP_Begin" = "move container to workspace number 15";
          "${modifier}+Shift+KP_Right" = "move container to workspace number 16";
          "${modifier}+Shift+KP_Home" = "move container to workspace number 17";
          "${modifier}+Shift+KP_Up" = "move container to workspace number 18";
          "${modifier}+Shift+KP_Prior" = "move container to workspace number 19";
          "${modifier}+Shift+KP_Insert" = "move container to workspace number 20";
        };
      };
    };
  };

  programs.ssh.startAgent = true;

  # Enable polkit
  security.polkit.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
