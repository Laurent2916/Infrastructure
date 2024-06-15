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
      usernamehw.errorlens
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "editor.fontLigatures" = true;
      "editor.rulers" = [120];
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "gitmoji.showEmojiCode" = true;
      "terminal.integrated.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = -0.75;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.empty.hint" = "hidden";
      "workbench.iconTheme" = "catppuccin-mocha";
      "gitlens.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
      "editor.inlineSuggest.enabled" = true;
      "liveshare.presence" = true;
      "github.copilot.enable" = {"markdown" = true;};
      "github.copilot.editor.enableAutoCompletions" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "julia.enableTelemetry" = false;
      "julia.symbolCacheDownload" = true;
      "terminal.integrated.commandsToSkipShell" = ["language-julia.interrupt"];
      "diffEditor.ignoreTrimWhitespace" = false;
      "remote.SSH.useExecServer" = false;
      "python.analysis.typeCheckingMode" = "strict";
      "files.exclude" = {
        # defaults
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
        "**/Thumbs.db" = true;
        # annoying
        "**/__pycache__" = true;
        "**/.mypy_cache" = true;
        "**/.ruff_cache" = true;
        "**/*.egg-info" = true;
        "**/.direnv" = true;
      };
    };
  };
}
