# !/bin/bash
# Location: $HOME/T-Pro/banner-logo/arrow-design.sh
# Design By MarMu 

# Colors
CYAN="\e[1;36m"
GREEN="\e[1;32m"
WHITE="\e[1;37m"
YELLOW="\e[1;33m"
MAGENTA="\e[1;35m"
RESET="\e[0m"

# Loading Effect ကို ချိတ်ဆက်ခြင်း
source "$HOME/T-Pro/banner-logo/show-effect.sh"

clear
echo -e "${CYAN}╔══════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║${GREEN}               SELECT PROMPT DESIGN               ${CYAN}║${RESET}"
echo -e "${CYAN}╠══════════════════════════════════════════════════╣${RESET}"
echo -e "${CYAN}║${WHITE}  [1] Hacker Style    ${YELLOW}(root@termux:~#)            ${CYAN}║${RESET}"
echo -e "${CYAN}║${WHITE}  [2] Epic Style      ${YELLOW}(┌──[user]──[~] └──►)       ${CYAN}║${RESET}"
echo -e "${CYAN}║${WHITE}  [3] Fancy Style     ${YELLOW}(╭─[user]─[~] ╰─➤)          ${CYAN}║${RESET}"
echo -e "${CYAN}║${WHITE}  [4] Legendary Style ${YELLOW}(⚔️ [user] ❯ ~ ❯❯)           ${CYAN}║${RESET}"
echo -e "${CYAN}║${WHITE}  [5] Pro Style       ${YELLOW}(● user cwd ❯ ~ $)          ${CYAN}║${RESET}"
echo -e "${CYAN}║${WHITE}  [6] Skip / Keep Default                         ${CYAN}║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════╝${RESET}"
read -p "Select a design (1-6): " prompt_opt

BANNER_CONFIG="$HOME/.termux_banner.sh"

case $prompt_opt in
    1)
        show_loading "Applying Hacker Style Prompt"
        cat << 'EOF' >> "$BANNER_CONFIG"
if [ -n "${ZSH_VERSION:-}" ]; then
    autoload -U colors 2>/dev/null && colors 2>/dev/null
    PROMPT=$'%F{green}root@termux%F{white}:%F{red}%~ %F{green}# %f'
elif [ -n "${BASH_VERSION:-}" ]; then
    PS1='\[\e[1;32m\]root@termux\[\e[1;37m\]:\[\e[1;31m\]\w \[\e[1;32m\]# \[\e[0m\]'
fi
EOF
        ;;
    2)
        show_loading "Applying Epic Style Prompt"
        cat << 'EOF' >> "$BANNER_CONFIG"
if [ -n "${ZSH_VERSION:-}" ]; then
    autoload -U colors 2>/dev/null && colors 2>/dev/null
    PROMPT=$'%F{cyan}\n┌──[%F{green}%n%F{cyan}]──[%F{blue}%~%F{cyan}]\n└──► %f'
elif [ -n "${BASH_VERSION:-}" ]; then
    PS1='\n\[\e[1;36m\]┌──[\[\e[1;32m\]\u\[\e[1;36m\]]──[\[\e[1;34m\]\w\[\e[1;36m\]]\n└──► \[\e[0m\]'
fi
EOF
        ;;
    3)
        show_loading "Applying Fancy Style Prompt"
        cat << 'EOF' >> "$BANNER_CONFIG"
if [ -n "${ZSH_VERSION:-}" ]; then
    autoload -U colors 2>/dev/null && colors 2>/dev/null
    PROMPT=$'%F{magenta}\n╭─[%F{yellow}%n%F{magenta}]─[%F{cyan}%~%F{magenta}]\n╰─➤ %f'
elif [ -n "${BASH_VERSION:-}" ]; then
    PS1='\n\[\e[1;35m\]╭─[\[\e[1;33m\]\u\[\e[1;35m\]]─[\[\e[1;36m\]\w\[\e[1;35m\]]\n╰─➤ \[\e[0m\]'
fi
EOF
        ;;
    4)
        show_loading "Applying Legendary Style Prompt"
        cat << 'EOF' >> "$BANNER_CONFIG"
if [ -n "${ZSH_VERSION:-}" ]; then
    autoload -U colors 2>/dev/null && colors 2>/dev/null
    PROMPT=$'\n%F{red}⚔️ [%F{white}%n%F{red}] %F{blue}❯ %F{cyan}%~ %F{yellow}❯❯ %f'
elif [ -n "${BASH_VERSION:-}" ]; then
    PS1='\n\[\e[1;31m\]⚔️ [\[\e[1;37m\]\u\[\e[1;31m\]] \[\e[1;34m\]❯ \[\e[1;36m\]\w \[\e[1;33m\]❯❯ \[\e[0m\]'
fi
EOF
        ;;
    5)
        show_loading "Applying Pro Style Prompt"
        cat << 'EOF' >> "$BANNER_CONFIG"
if [ -n "${ZSH_VERSION:-}" ]; then
    autoload -U colors 2>/dev/null && colors 2>/dev/null
    PROMPT=$'\n%F{green}● %n %F{blue}cwd ❯ %F{cyan}%~ %F{white}$ %f'
elif [ -n "${BASH_VERSION:-}" ]; then
    PS1='\n\[\e[1;32m\]● \u \[\e[1;34m\]cwd ❯ \[\e[1;36m\]\w \[\e[1;37m\]\$ \[\e[0m\]'
fi
EOF
        ;;
    6|*)
        echo -e "\n${CYAN}[i] Skipped prompt design. Keeping current PS1.${RESET}"
        ;;
esac
