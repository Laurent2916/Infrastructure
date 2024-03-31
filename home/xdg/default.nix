{...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # firefox
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";
      "image/png" = "firefox.desktop";
      "image/jpeg" = "firefox.desktop";
      "image/gif" = "firefox.desktop";

      # vscode
      "text/plain" = "code.desktop";
      "text/x-python" = "code.desktop";
      "application/json" = "code.desktop";
      "application/yaml" = "code.desktop";
      "application/xml" = "code.desktop";
      "application/javascript" = "code.desktop";
      "text/css" = "code.desktop";

      # mpv
      "video/mpeg" = "mpv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";

      # thunderbird
      "text/calendar" = "thunderbird.desktop";
      "text/x-vcard" = "thunderbird.desktop";
    };
  };
}
