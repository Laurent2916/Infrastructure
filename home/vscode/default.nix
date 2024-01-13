{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      eamodio.gitlens
      editorconfig.editorconfig
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github
      jnoortheen.nix-ide
      kamadorueda.alejandra
      mkhl.direnv
      ms-vsliveshare.vsliveshare
      seatonjiang.gitmoji-vscode
      tamasfe.even-better-toml
      yzhang.markdown-all-in-one
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "gitmoji.showEmojiCode" = true;
      "terminal.integrated.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = -0.25;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.empty.hint" = "hidden";
      "workbench.iconTheme" = "catppuccin-mocha";
      "gitlens.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
      "editor.inlineSuggest.enabled" = true;
      "liveshare.presence" = true;
      "github.copilot.enable" = {"markdown" = true;};
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "julia.enableTelemetry" = false;
      "julia.symbolCacheDownload" = true;
      "terminal.integrated.commandsToSkipShell" = ["language-julia.interrupt"];
    };
  };
}
