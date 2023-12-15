{ inputs, system, ... }: {
  alias = inputs.TP-calcul-parallele.packages.${system}.report + "/";
}
