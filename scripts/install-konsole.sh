#!/usr/bin/env bash
set -euo pipefail
if (( EUID == 0 )); then
  printf 'Run as your regular desktop user, not root.\n' >&2
  exit 1
fi
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
dest="$HOME/.local/share/konsole"
mkdir -p -- "$dest"
for name in VSCode-DarkPlus.colorscheme Tux_Debian.profile; do
  target="$dest/$name"
  if [[ -e "$target" ]]; then
    backup="$target.backup-pmdt-$(date +%Y%m%d-%H%M%S)"
    cp -p -- "$target" "$backup"
    printf 'Backed up %s to %s\n' "$target" "$backup"
  fi
  cp -- "$project_dir/konsole/$name" "$target"
done
printf 'Installed Konsole files. Select the Tux_Debian profile in Konsole Settings.\n'
