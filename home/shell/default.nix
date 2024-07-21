{...}: {
  imports = [
    ./atuin.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./exa.nix
    ./git.nix
    ./micro.nix
    ./ssh.nix
    ./mpv.nix
    ./tmux.nix
    ./fish.nix
  ];

  home.sessionVariables = {
    DO_NOT_TRACK = 1;
  };
}
