{...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # librewolf
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "application/pdf" = "librewolf.desktop";
      "image/png" = "librewolf.desktop";
      "image/jpeg" = "librewolf.desktop";
      "image/gif" = "librewolf.desktop";

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
