{pkgs, ...}: let
  user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36";
in {
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;

    profiles = {
      laurent = {
        isDefault = true;
        userChrome = ''
          #unifiedToolbarContent {
            display: none !important;
          }
        '';
      };
    };

    settings = {
      "general.useragent.override" = user_agent;
      "privacy.donottrackheader.enabled" = true;
      "permissions.default.desktop-notification" = 1;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
