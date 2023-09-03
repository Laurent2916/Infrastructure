# stop on error
set -euxo pipefail

# update lock file
nix flake update

# update systems
sudo nixos-rebuild switch -L --flake .#neodymium
nixos-rebuild switch -L --flake .#hydrogen --target-host hydrogen

# commit and push lock file
git add flake.lock
git commit -m "⬆️ nix flake update"
git push
