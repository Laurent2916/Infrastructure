{
  inputs,
  system,
  ...
}: {
  alias =
    inputs.projet-intelligence-artificielle-multimedia.packages.${system}.slides
    + "/";
}
