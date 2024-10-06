{
  inputs,
  system,
  location,
  vhost,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = inputs.TP-traitement-audio-visuel.packages.${system}.notebooks + "/";
  };

  services.gatus.settings.endpoints = [
    {
      name = location;
      group = vhost;
      url = "https://${vhost}/${location}/";
      interval = "15m";
      conditions = [
        "[STATUS] == 200"
        "[RESPONSE_TIME] < 300"
        "[BODY] == pat(*pluto_notebook*)"
      ];
    }
  ];
}
