{...}: {
  age.secrets.gitea = {
    file = ../../../../secrets/gitea.age;
    owner = "gitea";
    group = "gitea";
  };
  age.identityPaths = ["/root/.ssh/id_ed25519"];
}
