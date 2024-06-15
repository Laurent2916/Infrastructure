{...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      laurent = {
        isDefault = true;
        settings = {
          "browser.startup.page" = 3; # always restore tabs
          "privacy.donottrackheader.enabled" = true;
          "browser.ctrlTab.sortByRecentlyUsed" = true; # change Ctrl+Tab behaviour
          "general.autoScroll" = true;
        };
      };
    };
  };
}
