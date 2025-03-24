{
  inputs,
  pkgs,
  ...
}: let
  user_agent = "Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0";
  buildXpiAddon = {
    name,
    version,
    id,
    url,
    sha256,
    ...
  }:
    pkgs.stdenvNoCC.mkDerivation {
      inherit name version;
      src = pkgs.fetchurl {inherit url sha256;};
      preferLocalBuild = true;
      allowSubstitutes = true;
      dontUnpack = true;
      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${id}.xpi"
      '';
    };
in {
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;

    profiles = {
      laurent = {
        isDefault = true;
        userChrome = ''
          #unifiedToolbarContent {
            display: none !important;
          }
        '';
        extensions = [
          inputs.thunderbird-shortcuts.packages."x86_64-linux".youtube-music
          inputs.thunderbird-shortcuts.packages."x86_64-linux".finegrain-slack
          inputs.thunderbird-shortcuts.packages."x86_64-linux".discord
          inputs.thunderbird-shortcuts.packages."x86_64-linux".element
          (
            buildXpiAddon {
              name = "catppuccin-mocha-blue.thunderbird.theme";
              id = "{f6d05f0c-39a8-5c4d-96dd-4852202a8244}";
              version = "1.0.0";
              url = "https://github.com/catppuccin/thunderbird/raw/0289f3b/themes/mocha/mocha-blue.xpi";
              sha256 = "sha256-ApuqSR6GWY1guajM+laozGNBVMq9BWlcKz16hbeFoLU=";
            }
          )
          (
            buildXpiAddon {
              name = "ublock-origin.thunderbird.addon";
              id = "uBlock0@raymondhill.net";
              version = "1.49.2";
              url = "https://addons.thunderbird.net/thunderbird/downloads/file/1021926/ublock_origin-1.49.2-tb.xpi";
              sha256 = "sha256-I7J6OdP3JRRnsUgozgMPCv6xxqQGttVowBivO2DjXcg=";
            }
          )
        ];
      };
    };

    settings = {
      "general.useragent.override" = user_agent;
      "privacy.donottrackheader.enabled" = true;
      "permissions.default.desktop-notification" = 1;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "apz.overscroll.enabled" = false; # disable overscroll
    };
  };

  home.persistence."/persist/home/laurent" = {
    directories = [
      ".thunderbird"
    ];
  };
}
