# error handler
handle_error() {
  echo "Upgrade failed."
  read -p "Press Enter to exit..."
  exit 1
}

# stop on error
set -euxo pipefail

# trap any errors and call handle_error
trap 'handle_error "$BASH_COMMAND"' ERR

# update lock file
nix flake update

# update systems
sudo nixos-rebuild switch -L --flake .#silicium
nixos-rebuild switch -L --flake .#cesium --target-host cesium

# commit and push lock file
git add flake.lock
git commit -m "⬆️ nix flake update"
git push

echo "Upgrade successful"
