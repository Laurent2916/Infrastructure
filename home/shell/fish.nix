{...}: {
  programs.fish = {
    enable = true;

    functions = {
      fish_greeting = "";
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
  };
}
