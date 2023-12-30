{inputs, ...}: {
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    extraConfig = builtins.readFile "${inputs.catppuccin-mako}/src/mocha";
  };
}
