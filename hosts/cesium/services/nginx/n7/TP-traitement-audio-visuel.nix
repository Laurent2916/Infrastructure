{
  inputs,
  system,
  ...
}: {
  alias = inputs.TP-traitement-audio-visuel.packages.${system}.notebooks + "/";
}
