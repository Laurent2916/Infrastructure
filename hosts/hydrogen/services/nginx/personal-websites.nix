{ ... }: {
  services.nginx.virtualHosts = {

    "fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations."/".return =
        ''301 "$scheme://laurent.fainsin.bzh$request_uri"'';
    };
    "laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/";
    };
    default = {
      default = true;
      locations."/".return = ''301 "$scheme://fainsin.bzh" '';
    };

  };
}
