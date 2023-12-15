{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      exec-once=env XDG_CACHE_HOME=/tmp eww open bar
      exec-once=${pkgs.swaybg}/bin/swaybg -i ~/Pictures/wallpapers/kai-oberhauser-unsplash.jpg
      exec-once=mako
      exec-once=element-desktop
      exec-once=thunderbird
      exec-once=webcord
      exec-once=wl-paste --watch cliphist store
      exec-once=gnome-keyring-daemon --start --components=secrets
    '' + builtins.readFile ./hyprland.conf;
  };
}
