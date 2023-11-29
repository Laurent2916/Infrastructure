{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 642 ];
  };
}
