# Debian Crimson — user prompt for interactive Bash
# Requires a Nerd Font for the Debian, folder and Powerline glyphs.
# Colors: Debian crimson #A80030 and wine #683046.
if [[ $- == *i* ]]; then
    alias ls='eza --icons=always --group-directories-first'
    PS1='\[\e[48;2;168;0;48m\e[97m\]  \u \[\e[48;2;104;48;70m\e[38;2;168;0;48m\]\[\e[97m\]  \w \[\e[0m\e[38;2;104;48;70m\]\[\e[0m\]\n\[\e[1;38;2;168;0;48m\]╰─❯\[\e[0m\] '
fi
