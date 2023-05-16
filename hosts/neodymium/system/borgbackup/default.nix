{ config, ... }: {
  services.borgbackup.jobs.home = {
    paths = "/home/laurent/";
    repo = "/mnt/home_backup";
    exclude = [
      # Largest cache dirs
      ".cache"
      ".compose-cache"
      "*/cache"
      "*/cache2" # firefox
      "*/Cache"
      "*/Code Cache"
      ".config/Slack/logs"
      ".config/Code/CachedData"
      ".container-diff"
      ".npm/_cacache"
      # Work related dirs
      "*/node_modules"
      "*/bower_components"
      "*/build"
      "*/_build"
      "*/.tox"
      "*/venv"
      "*/.venv"
    ];
    encryption = {
      mode = "repokey";
      passCommand = "cat ${config.age.secrets.borgbackup.path}";
    };
    compression = "auto,zstd";
    startAt = [ ];
  };
}
