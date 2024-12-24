<h1 align=center>

  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/56b7a5788005a3eaecb5298f0dbed0f7d1573abc/logo/nix-snowflake-colours.svg" width=100px>

  Laureηt's Infrastructure <br>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/c675f7ccdc325cf6ba228ebb53fdf4eaa40aace6/assets/palette/macchiato.png" width="600px">

  <a href="/LICENSE">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&color=a6e3a1&labelColor=1e1e2e"/>
  </a>
  <a href="https://nixos.org/">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=NixOS&message=24.11&color=89b4fa&labelColor=1e1e2e">
  </a>

</h1>

## Highlights

This repository contains the configuration files for my personal infrastructure. It is based on [NixOS](https://nixos.org/), a declarative Linux distribution that enables reliable system upgrades. The infrastructure is organized as follows:

```bash
.
├── secrets           # Managed by agenix
├── home              # Managed by Home Manager
│   ├── shell         # fish shell dotfiles
│   ├── desktop       # hyprland wayland desktop
│   ├── applications  # firefox, thunderbird, ...
│   └── packages.nix  # miscellaneous packages
└── hosts             # Managed by NixOS
    ├── aurum         # work laptop
    │   ├── services  # greetd, ...
    │   └── system    # impermanence, disko, ...
    └── xenon         # home server
        ├── services  # forgejo, atuin, ...
        └── system    # impermanence, disko, ...
```
