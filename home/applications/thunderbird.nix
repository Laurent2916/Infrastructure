{pkgs, ...}: let
  user_agent = "Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0";
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

  home.persistence."/persist/home/laurent" = {
    directories = [
      ".thunderbird"
    ];
  };
}
