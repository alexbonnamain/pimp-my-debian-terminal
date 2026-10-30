#!/usr/bin/env bash
set -euo pipefail
if (( EUID == 0 )); then
  printf 'Run this installer as your regular user, not root.\n' >&2
  exit 1
fi
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_file="$project_dir/bash/user-prompt.bash"
bashrc="$HOME/.bashrc"
start='# >>> Debian Crimson (pimp-my-debian-terminal) >>>'
end='# <<< Debian Crimson (pimp-my-debian-terminal) <<<'
[[ -f "$bashrc" ]] || touch "$bashrc"
if grep -Fqx "$start" "$bashrc"; then
  printf 'Debian Crimson block already present in %s; no changes made.\n' "$bashrc"
  exit 0
fi
backup="$bashrc.backup-pmdt-$(date +%Y%m%d-%H%M%S)"
cp -p -- "$bashrc" "$backup"
{
  printf '\n%s\n' "$start"
  printf '# Load the prompt from this project; keep the repository directory in place.\n'
  printf 'source %q\n' "$source_file"
  printf '%s\n' "$end"
} >> "$bashrc"
printf 'Backup: %s\nInstalled. Open a new Bash shell to see changes.\n' "$backup"
