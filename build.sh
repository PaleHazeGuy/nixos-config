#!/usr/bin/env bash
set -euo pipefail

debug=0
hostname=

for arg in "$@"; do
  case "$arg" in
    --debug) debug=1 ;;
    -*) echo "unknown flag: $arg" >&2; exit 1 ;;
    *) hostname="$arg" ;;
  esac
done

if [[ -z "$hostname" ]]; then
  echo "usage: $0 [--debug] <hostname>" >&2
  echo "  $0 rog-flow-z13" >&2
  echo "  $0 --debug rog-flow-z13" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cleanup() {
  git -C "$script_dir" rm -r --cached secrets/ --quiet 2>/dev/null || true
}
trap cleanup EXIT

git -C "$script_dir" add -f secrets/

action=switch
[[ $debug -eq 1 ]] && action=dry-activate

sudo nixos-rebuild "$action" --flake "${script_dir}#${hostname}"