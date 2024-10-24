{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # https://notofonts.github.io/
    noto-fonts # standard characters
    noto-fonts-lgc-plus # latin, greek, and cyrillic
    noto-fonts-cjk-sans # chinese, japanese, and korean
    noto-fonts-emoji # emojis 🐢

    # https://github.com/tonsky/FiraCode
    fira-code # standard characters
    fira-code-symbols # unicode ligature glyphs

    # https://github.com/ryanoasis/nerd-fonts
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];
}
