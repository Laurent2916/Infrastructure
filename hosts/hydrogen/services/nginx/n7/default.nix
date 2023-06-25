{ pkgs, ... }: {
  services.nginx.virtualHosts = {
    "n7.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;

      locations = {
        "/".return = "301 $scheme://git.fainsin.bzh/ENSEEIHT";
      } // {
        "/projet-audionumerique/" = import ./projet-audionumerique.nix pkgs;
        "/projet-systemes-algorithmes-repartis/" =
          import ./projet-systemes-algorithmes-repartis.nix pkgs;
      };
    };
  };
}
