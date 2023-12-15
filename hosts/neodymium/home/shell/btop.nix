{pkgs, ...}: let
  catppuccin-btop = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = "c6469190f2ecf25f017d6120bf4e050e6b1d17af";
    sha256 = "sha256-jodJl4f2T9ViNqsY9fk8IV62CrpC5hy7WK3aRpu70Cs=";
  };
in {
  xdg.configFile."btop/themes".source = "${catppuccin-btop}/themes";

  programs.btop = {
    enable = true;

    settings = {
      theme_background = false;
      color_theme = "catppuccin_mocha";

      clock_format = "%Y-%m-%d %X";
    };
  };

  programs.zsh.shellAliases = {htop = "btop";};
}
