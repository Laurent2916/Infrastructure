{lib, ...}: let
  zoomValues = lib.concatStringsSep "," (map (n: let str = toString (n / 100.0); in builtins.substring 0 4 str) (lib.range 1 200));
in {
  programs.firefox = {
    enable = true;
    profiles = {
      laurent = {
        isDefault = true;
        settings = {
          "browser.startup.page" = 3; # always restore tabs
          "privacy.donottrackheader.enabled" = true; # enable DNT header
          "browser.ctrlTab.sortByRecentlyUsed" = true; # change Ctrl+Tab behaviour
          "toolkit.zoomManager.zoomValues" = zoomValues; # set custom zoom levels
          "general.autoScroll" = true; # enable middle-click autoscroll
          # additional devtools
          "devtools.browsertoolbox.enabled" = false;
          "devtools.debugger.remote-enabled" = false;
          "devtools.chrome.enabled" = false;
          # enable userChrome.css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #TabsToolbar {
            display: none !important;
          }
        '';
      };
    };
  };
}
