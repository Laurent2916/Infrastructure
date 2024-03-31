{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;

    clock24 = true;
  };
}
