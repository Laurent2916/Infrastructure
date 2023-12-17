{
  inputs,
  system,
  ...
}: {
  alias = inputs.projet-systemes-algorithmes-repartis.packages.${system}.slides + "/";
}
