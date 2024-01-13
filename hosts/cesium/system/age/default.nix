{...}: {
  age.secrets.gitea = {
    file = ../../../../secrets/gitea.age;
    owner = "gitea";
    group = "gitea";
  };
}
