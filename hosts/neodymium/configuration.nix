{ config, pkgs, lib, ... }:

let

  catppuccin-alacritty = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = "3c808cbb4f9c87be43ba5241bc57373c793d2f17";
    sha256 = "w9XVtEe7TqzxxGUCDUR9BFkzLZjG8XrplXJ3lX6f+x0=";
  };

  catppuccin-discord = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "159aac939d8c18da2e184c6581f5e13896e11697";
    sha256 = "sha256-cWpog52Ft4hqGh8sMWhiLUQp/XXipOPnSTG6LwUAGGA=";
  };

  catppuccin-bat = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
  };

in {
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

  # use systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable NTFS disk mounting
  boot.supportedFilesystems = [ "ntfs" ];

  # clean /tmp at each boot
  boot.cleanTmpDir = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # restrict nix command to sudoers
  nix.allowedUsers = [ "@wheel" ];

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
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.zsh;
  };
  home-manager.users.laurent = {
    home.stateVersion = "22.11";
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

      mpv
      feh
      keepassxc
      x2goclient
      thunderbird
      element-desktop
      libreoffice-fresh
    ];

    services.mpris-proxy.enable = true;

    home.pointerCursor = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };

    gtk = {
      enable = true;
      font = {
        name = "Inter";
        package = pkgs.inter;
        size = 10;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk;
      };
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      enableCompletion = true;
      sessionVariables = {
        MANPAGER = "nvim +Man!";
        VISUAL = "nvim";
        EDITOR = "nvim";
      };
      # shellAliases = {
      #   cat = "bat";
      #   df = "duf";
      # };
      history = {
        size = 1000000000;
        path = "$HOME/.zsh_history";
        extended = true;
      };
      loginExtra = ''
        if [[ "$(tty)" == "/dev/tty1" ]]; then
          exec sway
        fi
      '';
      initExtra = ''
        bindkey -e
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;3D" backward-word
        bindkey '^H' backward-kill-word
        bindkey '5~' kill-word
        eval "$(direnv hook zsh)"
      '';
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./.;
          file = ".p10k.zsh";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.5.0";
            sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
          };
        }
      ];
    };

    programs.direnv = { # TODO: use github:numtide/devshell ?
      enable = true;
      nix-direnv.enable = true;
    };

    programs.webcord = {
      enable = true;
      themes = {
        CatpuccinMocha = "${catppuccin-discord}/themes/mocha.theme.css";
      };
    };

    programs.git = {
      enable = true;
      userName = "Laureηt";
      userEmail = "laurent@fainsin.bzh";
      signing = {
        signByDefault = true;
        key =
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINTvwXCT99s1EwOCeGQ28jyCAH/RBoLZza9k5I7wWdEu laurent@neodymium";
      };
    };

    programs.bat = {
      enable = true;
      themes = {
        catppuccin =
          builtins.readFile "${catppuccin-bat}/Catppuccin-mocha.tmTheme";
      };
      config.theme = "catppuccin";
      extraPackages = with pkgs.bat-extras; [ batman ];
    };
    programs.zsh.shellAliases = {
      cat = "bat";
      man = "batman";
    };

    programs.exa = { enable = true; };
    programs.zsh.shellAliases = {
      l = "exa -l -h -g --icons --git --time-style=long-iso";
      ls = "exa -l -h -g --icons --git --time-style=long-iso --grid";
      ll = "exa -l -h -g --icons --grid --git --time-style=long-iso -a";
    };

    programs.alacritty = {
      enable = true;
      settings = {
        import = [ "${catppuccin-alacritty}/catppuccin-mocha.yml" ];
        window.opacity = 0.825;
        font = {
          normal.family = "FiraCode Nerd Font Mono";
          size = 9.5;
        };
      };
    };

    programs.librewolf = {
      enable = true;
      settings = {
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.downloads" = false;
        "privacy.donottrackheader.enabled" = true;
        "browser.ctrlTab.sortByRecentlyUsed" = true; # change Ctrl+Tab behaviour
        "general.autoScroll" = true;
        "pdfjs.viewerCssTheme" = 2; # dark theme for pdf viewer
        "browser.startup.page" = 3; # always restore tabs
      };
    };

    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        brettm12345.nixfmt-vscode
        arrterian.nix-env-selector

        ms-vsliveshare.vsliveshare
        ms-python.vscode-pylance
        eamodio.gitlens
        github.copilot

        yzhang.markdown-all-in-one
        editorconfig.editorconfig

        catppuccin.catppuccin-vsc
        file-icons.file-icons
      ];
      userSettings = {
        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "terminal.integrated.fontFamily" =
          "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
        "window.menuBarVisibility" = "toggle";
        "window.zoomLevel" = -0.25;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.editor.untitled.hint" = "hidden";
        "workbench.iconTheme" = "file-icons";
        "gitlens.telemetry.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "editor.inlineSuggest.enabled" = true;
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
          eDP-1 = {
            mode = "1920x1080";
            adaptive_sync = "on";
          };
          eDP-2 = {
            mode = "1920x1080";
            adaptive_sync = "on";
          };
          DP-1 = { disable = ""; };
        };
        fonts = {
          names = [ "FiraCode" ];
          size = 10.0;
        };
        bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
        gaps = {
          smartGaps = true;
          inner = 5;
        };
        window = { border = 0; };
        floating = { border = 0; };
        focus = { followMouse = "no"; };
        startup = [
          { command = "element-desktop"; }
          { command = "thunderbird"; }
          { command = "webcord"; }
          {
            command = ''
              swayidle -w \
                timeout 100 'swaylock -f --grace 3' \
                timeout 130 'swaymsg "output * dpms off"' \
                resume 'swaymsg "output * dpms on"' \
                timeout 300 'systemctl suspend' \
                before-sleep 'swaylock -f'
            '';
          }
        ];
        assigns = {
          "8" = [{ class = "^WebCord$"; }];
          "9" = [{ class = "^Element$"; }];
          "10" = [{ app_id = "thunderbird"; }];
        };
        keybindings = {
          # Start a terminal
          "${modifier}+Return" = "exec ${terminal}";
          # Kill focused window
          "${modifier}+q" = "kill";
          # Reload the configuration file
          "${modifier}+twosuperior" = "reload";
          # Exit sway (logs you out of your Wayland session)
          "${modifier}+Shift+e" =
            "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
          # Lock
          "${modifier}+Delete" = "exec swaylock -f";

          # Screenshot whole screen
          "Print" = "exec grim `date +'%Y-%m-%dT%H:%M:%S'`.png";
          # Screenshot whole screen to clipboard
          "Shift+Print" = "exec grim - | wl-copy -t 'image/png'";
          # Screenshot area
          "${modifier}+Print" =
            "exec slurp -d | grim -g - `date +'%Y-%m-%dT%H:%M:%S'`.png";
          # Screenshot area to clipboard
          "${modifier}+Shift+Print" =
            "exec slurp -d | grim -g - - | wl-copy -t 'image/png'";

          # backlight
          "XF86MonBrightnessUp" = "exec light -A 5";
          "XF86MonBrightnessDown" = "exec light -U 5";

          # audio
          "XF86AudioMute" = "exec pamixer --sink 0 -t";
          "XF86AudioRaiseVolume" = "exec pamixer -i 5";
          "XF86AudioLowerVolume" = "exec pamixer -d 5";
          "XF86AudioMicMute" = "exec pamixer --source 0 -t";

          # split horizontally or vertically
          "${modifier}+b" = "splith";
          "${modifier}+v" = "splitv";
          # Make the current focus fullscreen
          "${modifier}+f" = "fullscreen";
          # Toggle the current focus between tiling and floating mode
          "${modifier}+s" = "floating toggle";

          # Move your focus around
          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          # Move the focused window around
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

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
          "${modifier}+Shift+ampersand" =
            "move container to workspace number 1";
          "${modifier}+Shift+eacute" = "move container to workspace number 2";
          "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
          "${modifier}+Shift+apostrophe" =
            "move container to workspace number 4";
          "${modifier}+Shift+parenleft" =
            "move container to workspace number 5";
          "${modifier}+Shift+minus" = "move container to workspace number 6";
          "${modifier}+Shift+egrave" = "move container to workspace number 7";
          "${modifier}+Shift+underscore" =
            "move container to workspace number 8";
          "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
          "${modifier}+Shift+agrave" = "move container to workspace number 10";
          "${modifier}+Shift+KP_End" = "move container to workspace number 11";
          "${modifier}+Shift+KP_Down" = "move container to workspace number 12";
          "${modifier}+Shift+KP_Next" = "move container to workspace number 13";
          "${modifier}+Shift+KP_Left" = "move container to workspace number 14";
          "${modifier}+Shift+KP_Begin" =
            "move container to workspace number 15";
          "${modifier}+Shift+KP_Right" =
            "move container to workspace number 16";
          "${modifier}+Shift+KP_Home" = "move container to workspace number 17";
          "${modifier}+Shift+KP_Up" = "move container to workspace number 18";
          "${modifier}+Shift+KP_Prior" =
            "move container to workspace number 19";
          "${modifier}+Shift+KP_Insert" =
            "move container to workspace number 20";
        };
        workspaceOutputAssign = [
          {
            workspace = "1";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "2";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "3";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "4";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "5";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "6";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "7";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "8";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "9";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "10";
            output = "eDP-1 eDP-2";
          }
          {
            workspace = "11";
            output = "DP-1";
          }
          {
            workspace = "12";
            output = "DP-1";
          }
          {
            workspace = "13";
            output = "DP-1";
          }
          {
            workspace = "14";
            output = "DP-1";
          }
          {
            workspace = "15";
            output = "DP-1";
          }
          {
            workspace = "16";
            output = "DP-1";
          }
          {
            workspace = "17";
            output = "DP-1";
          }
          {
            workspace = "18";
            output = "DP-1";
          }
          {
            workspace = "19";
            output = "DP-1";
          }
          {
            workspace = "20";
            output = "DP-1";
          }
        ];
      };
    };
  };

  # enable ssh agent
  programs.ssh.startAgent = true;

  # enable polkit
  security.polkit.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
