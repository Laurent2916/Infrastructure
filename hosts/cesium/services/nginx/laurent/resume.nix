{
  inputs,
  system,
  ...
}: {
  services.nginx.virtualHosts = {
    "resume.laurent.fainsin.bzh" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = inputs.resume.packages.${system}.default;
          index = "resume.pdf";
        };
      };
    };
  };
}
