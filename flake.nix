{
  description = "Laurent's infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs }: {
    # colmena
    colmena = {
      meta = {
        nixpkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [];
        };
      };

      # personnal laptop
      neodymium = { name, nodes, ... }: {
        networking.hostName = "neodymium";

        imports = [
          ./hosts/neodymium/configuration.nix
        ];

        deployment = {
          allowLocalDeployment = true;
          targetHost = null;
        };
      };
    };
  };
}
