#!/usr/bin/env bash
set -euo pipefail

mode=switch
hostname=

for arg in "$@"; do
  case "$arg" in
    --test)  mode=test ;;
    --debug) mode=dry-activate ;;
    -*) echo "unknown flag: $arg" >&2; exit 1 ;;
    *) hostname="$arg" ;;
  esac
done

if [[ -z "$hostname" ]]; then
  echo "usage: $0 [--test|--debug] <hostname>" >&2
  echo "  $0 rog-flow-z13" >&2
  echo "  $0 --test rog-flow-z13" >&2
  echo "  $0 --debug rog-flow-z13" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cleanup() {
  git -C "$script_dir" rm -r --cached secrets/ --quiet 2>/dev/null || true
}
trap cleanup EXIT

git -C "$script_dir" add -f secrets/

sudo nixos-rebuild "$mode" --flake "${script_dir}#${hostname}"