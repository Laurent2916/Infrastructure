{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig =
      ''
        exec-once=env XDG_CACHE_HOME=/tmp ${pkgs.eww}/bin/eww open bar
        exec-once=${pkgs.swaybg}/bin/swaybg -i ${inputs.wallpaper}
        exec-once=${pkgs.mako}/bin/mako
        exec-once=${pkgs.thunderbird}/bin/thunderbird
        exec-once=${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store
        exec-once=${pkgs.gnome.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets
      ''
      + builtins.readFile ./hyprland.conf;
  };
}
