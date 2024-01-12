{pkgs, ...}: {
  # disable user creation/deletion
  users.mutableUsers = false;

  # configure users
  users = {
    users.laurent = {
      isNormalUser = true;
      initialPassword = "laurent";
      extraGroups = ["wheel" "video" "docker"];
      shell = pkgs.zsh;
    };
  };
}
