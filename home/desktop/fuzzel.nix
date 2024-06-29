{config, ...}: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        line-height = 15;
        lines = 10;
        layer = "overlay";
        icon-theme = config.gtk.iconTheme.name;
      };
      colors = {
        background = "1E1E2EEE";
        text = "7F849CFF";
        match = "89B4FAFF";
        selection = "45475AFF";
        selection-text = "CDD6F4FF";
        selection-match = "89B4FAFF";
      };
    };
  };
}
