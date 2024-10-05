{pkgs, ...}: {
  # disable user creation/deletion
  users.mutableUsers = false;

  # enable the fish shell globally
  programs.fish.enable = true;

  # configure users
  users = {
    users.laurent = {
      isNormalUser = true;
      initialPassword = "laurent";
      extraGroups = ["wheel" "video"];
      shell = pkgs.fish; # set login shell to fish
    };
  };
}
