{
  inputs,
  system,
  vhost,
  location,
  ...
}: {
  services.nginx.virtualHosts.${vhost}.locations."/${location}/" = {
    alias = inputs.projet-audionumerique.packages.${system}.slides + "/";
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
        "[BODY] == pat(*Whisper</h1>*)"
      ];
    }
  ];
}
