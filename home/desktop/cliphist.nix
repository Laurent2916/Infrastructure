{...}: {
  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = ["hyprland-session.target"];
  };

  home.persistence."/persist/home/laurent" = {
    files = [
      ".cache/cliphist/db"
    ];
  };
}
