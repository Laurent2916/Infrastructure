{...}: {
  home.persistence."/persist/home/laurent" = {
    allowOther = true;
    directories = [
      "Documents"
      "Images"
      "Videos"
      ".local/share/keyrings"
      ".local/share/bemoji"
      ".config/gcloud"
      ".cache/nix"
    ];
    files = [
      ".local/state/bemoji-history.txt"
    ];
  };
}
