{
  inputs,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # https://wiki.hyprland.org/Configuring/Variables/#variable-types
      "$mod" = "SUPER";

      # https://wiki.hyprland.org/Configuring/Keywords/#executing
      exec-once = [
        "env XDG_CACHE_HOME=`${pkgs.coreutils}/bin/mktemp -d --suffix '-eww'` ${lib.getExe pkgs.eww} open bar"
        "${lib.getExe pkgs.swaybg} -i ${inputs.wallpaper}"
        "${lib.getExe pkgs.mako}"
        "${lib.getExe pkgs.thunderbird}"
        "${lib.getExe pkgs.ghostty} --quit-after-last-window-closed=false --initial-window=false"
      ];

      # https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "DP-3,  1920x1080@120, 0x0,    1"
        "eDP-1, 1920x1200,     0x1080, 1"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 0;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "fr,fr";
        kb_variant = "azerty,ergol";
        sensitivity = 0;
        follow_mouse = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#touchpad
        touchpad = {
          natural_scroll = false;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#shadow
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          new_optimizations = 3;
        };
      };

      # https://wiki.hyprland.org/Configuring/Animations/
      animations = {
        enabled = false;
      };

      # https://wiki.hyprland.org/Configuring/Dwindle-Layout/
      general.layout = "dwindle";
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      # https://wiki.hyprland.org/Configuring/Workspace-Rules
      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      # https://wiki.hyprland.org/Configuring/Window-Rules/
      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];

      bind = [
        "$mod, Return, exec, ${lib.getExe pkgs.ghostty}"
        "$mod, Q, killactive,"
        "$mod, S, togglefloating,"
        "$mod, L, exec, ${lib.getExe pkgs.swaylock-effects} -f"
        "$mod, space, exec, ${lib.getExe pkgs.fuzzel}"
        "$mod, C, exec, ${lib.getExe pkgs.cliphist} list | ${lib.getExe pkgs.fuzzel} -d --tabs 2 --width 100 | ${lib.getExe pkgs.cliphist} decode | ${pkgs.wl-clipboard}/bin/wl-copy"
        "$mod, E, exec, BEMOJI_PICKER_CMD='${lib.getExe pkgs.fuzzel} -d' ${lib.getExe pkgs.bemoji} -n -e | ${pkgs.wl-clipboard}/bin/wl-copy"

        # Screenshot
        ", Print, exec, ${lib.getExe pkgs.grim} `date +'%Y-%m-%dT%H:%M:%S'`.png"
        "$mod, Print, exec, ${lib.getExe pkgs.grim} - | ${lib.getExe pkgs.satty} --filename - --fullscreen --initial-tool crop --copy-command ${pkgs.wl-clipboard}/bin/wl-copy"

        # Backlight
        ", XF86MonBrightnessUp, exec, ${lib.getExe pkgs.light} -A 5"
        ", XF86MonBrightnessDown, exec, ${lib.getExe pkgs.light} -U 5"

        # Audio
        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioPlay, exec, ${lib.getExe pkgs.playerctl} play-pause"
        ", XF86AudioStop, exec, ${lib.getExe pkgs.playerctl} stop"
        ", XF86AudioNext, exec, ${lib.getExe pkgs.playerctl} next"
        ", XF86AudioPrev, exec, ${lib.getExe pkgs.playerctl} previous"

        # Switch workspaces
        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, minus, workspace, 6"
        "$mod, egrave, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod, agrave, workspace, 10"

        # Switch window to workspace
        "$mod SHIFT, ampersand, movetoworkspacesilent, 1"
        "$mod SHIFT, eacute, movetoworkspacesilent, 2"
        "$mod SHIFT, quotedbl, movetoworkspacesilent, 3"
        "$mod SHIFT, apostrophe, movetoworkspacesilent, 4"
        "$mod SHIFT, parenleft, movetoworkspacesilent, 5"
        "$mod SHIFT, minus, movetoworkspacesilent, 6"
        "$mod SHIFT, egrave, movetoworkspacesilent, 7"
        "$mod SHIFT, underscore, movetoworkspacesilent, 8"
        "$mod SHIFT, ccedilla, movetoworkspacesilent, 9"
        "$mod SHIFT, agrave, movetoworkspacesilent, 10"
      ];

      bindm = [
        # Move/resize windows
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
