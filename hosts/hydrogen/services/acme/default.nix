{ ... }: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "acme@fainsin.bzh";
  };
}
