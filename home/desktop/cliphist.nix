{...}: {
  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTarget = "hyprland-session.target";
  };

  home.persistence."/persist/home/laurent" = {
    files = [
      ".cache/cliphist/db"
    ];
  };
}
