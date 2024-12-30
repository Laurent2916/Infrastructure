{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    borgbackup
    btop
    gitMinimal
    micro
    tmux
    sysz
  ];
}
