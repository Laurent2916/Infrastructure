{...}: {
  age.secrets.gitea = {
    file = ../../../../secrets/gitea.age;
    owner = "forgejo";
    group = "forgejo";
  };
}
