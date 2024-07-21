{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = inputs.website.packages.${system}.default;
        };
      };
    };
    "fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations."/".return = ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
    };
    default = {
      default = true;
      locations."/".return = ''301 "$scheme://laurent.fainsin.bzh" '';
    };
  };
}
