#!/usr/bin/env bash
set -euo pipefail
if (( EUID != 0 )); then
  printf 'Run with sudo or from an authenticated root shell.\n' >&2
  exit 1
fi
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_file='/root/.config/debian-crimson/root-prompt.bash'
install -d -m 0700 /root/.config/debian-crimson
install -m 0600 -- "$project_dir/bash/root-prompt.bash" "$source_file"
bashrc='/root/.bashrc'
start='# >>> Debian Crimson ROOT (pimp-my-debian-terminal) >>>'
end='# <<< Debian Crimson ROOT (pimp-my-debian-terminal) <<<'
[[ -f "$bashrc" ]] || touch "$bashrc"
if grep -Fqx "$start" "$bashrc"; then
  printf 'Root prompt block already present; no changes made.\n'
  exit 0
fi
backup="$bashrc.backup-pmdt-$(date +%Y%m%d-%H%M%S)"
cp -p -- "$bashrc" "$backup"
{
  printf '\n%s\n' "$start"
  printf '# Source a root-owned file, not an editable file in a regular user directory.\n'
  printf 'source %q\n' "$source_file"
  printf '%s\n' "$end"
} >> "$bashrc"
printf 'Backup: %s\nInstalled. Start a NEW root Bash shell to see changes.\n' "$backup"
