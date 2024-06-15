{...}: {
  programs.btop = {
    enable = true;

    settings = {
      theme_background = false;
      clock_format = "%Y-%m-%d %X";
    };
  };
}
