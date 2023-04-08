{ ... }: {
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
}
