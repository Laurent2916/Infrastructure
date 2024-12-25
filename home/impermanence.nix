{...}: {
  home.persistence."/persist/home/laurent" = {
    allowOther = false;
    directories = [
      "Documents"
      "Images"
      "Videos"
      ".mozilla"
      ".thunderbird"
      ".local/share/direnv"
      ".local/share/keyrings"
      ".local/share/atuin"
      ".local/share/bemoji"
      ".config/gcloud"
      ".config/Ankama Launcher"
      ".config/zaap"
      ".cache/nix"
      ".cache/huggingface"
      ".config/Code"
      ".vscode"
      ".ssh"
    ];
    files = [
      ".local/state/bemoji-history.txt"
      ".cache/cliphist/db"
      ".cache/fuzzel"
    ];
  };
}
