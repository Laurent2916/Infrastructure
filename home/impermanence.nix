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
      ".config/Ankama Launcher"
      ".config/zaap"
      ".cache/nix"
      ".cache/huggingface"
    ];
    files = [
      ".local/state/bemoji-history.txt"
    ];
  };
}
