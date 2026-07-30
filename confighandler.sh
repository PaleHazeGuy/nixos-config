#!/usr/bin/env bash
set -euo pipefail

files=(
	"yazi"
	"hypr"
	"kitty"
	"nvim"
	"zed"
)
suffix=".beforeflake"
mode="${1:-}"

[[ "$mode" == "backup" || "$mode" == "restore" ]] || { echo "usage: $0 <backup|restore>" >&2; exit 1; }

for name in "${files[@]}"; do
	real="$HOME/.config/$name"
	saved="$real$suffix"

	if [[ "$mode" == "backup" ]]; then
		src="$real"; dst="$saved"
	else
		src="$saved"; dst="$real"
	fi

	if [[ ! -e "$src" ]]; then
		echo "skip $name: $src doesn't exist"
	elif [[ "$mode" == "backup" && -L "$src" ]]; then
		echo "skip $name: already a home-manager symlink"
	elif [[ -e "$dst" && ! -L "$dst" ]]; then
		echo "skip $name: $dst exists and isn't a symlink -- resolve manually"
	else
		[[ -L "$dst" ]] && rm "$dst"
		mv "$src" "$dst"
		echo "$mode $name: $src -> $dst"
	fi
done
