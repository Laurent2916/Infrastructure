{...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.persistence."/persist/home/laurent" = {
    directories = [
      ".local/share/direnv"
    ];
  };
}
