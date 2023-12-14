{ inputs, system, ... }: {
  alias = inputs.projet-oral-japonais.packages.${system}.slides + "/";
}
