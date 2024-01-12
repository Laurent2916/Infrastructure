{
  inputs,
  system,
  ...
}: {
  alias = inputs.projet-audionumerique.packages.${system}.slides + "/";
}
