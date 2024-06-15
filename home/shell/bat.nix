{pkgs, ...}: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batman];
  };

  programs.fish.shellAliases = {
    cat = "bat";
    man = "batman";
  };
}
