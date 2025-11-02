#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
base_dir=$(cd "$script_dir/.." && pwd)

DIRS=(
	aerospace
	alacritty
	borders
	karabiner
	kitty
	nvim
	scripts
	sketchybar
	wallpapers
)

for dir in "${DIRS[@]}"; do
	src="$base_dir/$dir"
	dest="$HOME/.config/$dir"
	ln -sf $src $dest
done

echo "Bootstrapped"
