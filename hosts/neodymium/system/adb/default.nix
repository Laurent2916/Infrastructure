{ pkgs, ... }: {
  # udev rules
  services.udev.packages = [ pkgs.android-udev-rules ];

  # adb users
  users.users.laurent.extraGroups = [ "adbusers" ];
}
