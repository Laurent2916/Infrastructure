{
  inputs,
  pkgs,
  ...
}: let
  hyprland = inputs.hyprland.packages."${pkgs.system}".hyprland;
in {
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${hyprland}/bin/Hyprland";
        user = "greeter";
      };
    };
  };
}
