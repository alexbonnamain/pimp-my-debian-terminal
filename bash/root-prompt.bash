# Debian Crimson — root prompt for interactive Bash
# Visual distinction only: this does not change permissions or privileges.
if [[ $- == *i* ]]; then
    PS1='\[\e[48;2;168;0;48m\e[1;97m\]  ROOT \[\e[48;2;104;48;70m\e[38;2;168;0;48m\]\[\e[0;97;48;2;104;48;70m\]  \w \[\e[0;38;2;104;48;70m\]\[\e[0m\]\n\[\e[1;38;2;255;80;100m\]╰─#\[\e[0m\] '
fi
