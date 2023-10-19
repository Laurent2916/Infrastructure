{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github

      eamodio.gitlens
      editorconfig.editorconfig
      ms-vsliveshare.vsliveshare

      yzhang.markdown-all-in-one
      tamasfe.even-better-toml

      mkhl.direnv
      jnoortheen.nix-ide

      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "gitmoji.showEmojiCode" = true;
      "terminal.integrated.fontFamily" =
        "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = -0.25;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.empty.hint" = "hidden";
      "workbench.iconTheme" = "catppuccin-mocha";
      "gitlens.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
      "editor.inlineSuggest.enabled" = true;
      "liveshare.presence" = true;
      "github.copilot.enable" = { "markdown" = true; };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings"."nil"."formatting"."command" = [ "nixfmt" ];
      "julia.enableTelemetry" = false;
      "julia.symbolCacheDownload" = true;
      "terminal.integrated.commandsToSkipShell" =
        [ "language-julia.interrupt" ];
    };
  };
}
