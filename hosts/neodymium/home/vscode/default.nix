{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs
      (oldAttrs: {
        src = (builtins.fetchTarball {
          url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
          sha256 = "1f996x5i85zf0hpd7jx18zdqdp9nhxhf6zn83ai0njphz1dj354p";
        });
        pname = "vscode-insiders";
        version = "latest-2023-06-03";
      });
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      # github.copilot-chat

      eamodio.gitlens
      editorconfig.editorconfig
      ms-vsliveshare.vsliveshare

      yzhang.markdown-all-in-one
      tamasfe.even-better-toml

      mkhl.direnv
      jnoortheen.nix-ide

      catppuccin.catppuccin-vsc
      # catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "terminal.integrated.fontFamily" =
        "'FiraCode Nerd Font Mono', 'Noto Color Emoji'";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = -0.25;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.untitled.hint" = "hidden";
      "workbench.iconTheme" = "catppuccin-mocha";
      "gitlens.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
      "editor.inlineSuggest.enabled" = true;
      "liveshare.presence" = true;
      "github.copilot.enable" = {
        "*" = true;
        "yaml" = false;
        "plaintext" = false;
        "markdown" = true;
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings"."nil"."formatting"."command" = [ "nixfmt" ];
    };
  };
}
