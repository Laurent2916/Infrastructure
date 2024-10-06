{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop
    borgbackup
    gitMinimal
    sysz
  ];
}
