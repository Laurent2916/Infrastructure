{ pkgs, hyprland, ... }: {
  # disable user creation/deletion
  users.mutableUsers = false;

  # setup home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit hyprland; };
  };

  # configure users
  users = {
    # absolute gigachad
    users.laurent = {
      isNormalUser = true;
      initialPassword = "laurent";
      extraGroups = [ "wheel" "video" "docker" ];
      shell = pkgs.zsh;
    };
  };

  # configure users' home
  home-manager = {
    # gigachad's home
    users.laurent = ../../home;
  };
}
