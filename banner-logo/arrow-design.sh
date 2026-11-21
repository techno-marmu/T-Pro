#!/data/data/com.termux/files/usr/bin/bash
# ==============================================
#  T-Pro »» Arrow / Prompt Design Studio v4.0
# ==============================================
# Platform: Linux & Termux 
# Shell: Bash & Zsh (auto-detect-setting)
# Designs: Fancy, Epic, Classic, Hacker, Ninja
# Signature: Ⓜ = Myanmar/MarMu/Master/
# Own Creation By MarMu 
# ==============================================

RESET='\033[0m'
BOLD='\033[1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
ORANGE='\033[38;5;208m'
PINK='\033[38;5;206m'
LIME='\033[38;5;118m'
MAGENTA='\033[1;35m'

PROMPT_FILE="$HOME/.t-pro-prompt.sh"

print_success() { echo -e "${GREEN}[+] $1${RESET}"; }
print_error()   { echo -e "${RED}[!] Error: $1${RESET}"; }
print_info()    { echo -e "${BLUE}[i] $1${RESET}"; }
print_warning() { echo -e "${YELLOW}[~] $1${RESET}"; }

# ── Shell Detection ──
detect_shell() {
    if [ -n "${ZSH_VERSION:-}" ]; then
        echo "zsh"
    elif [ -n "${BASH_VERSION:-}" ]; then
        echo "bash"
    else
        case "$SHELL" in
            */zsh) echo "zsh" ;;
            */bash) echo "bash" ;;
            *) echo "bash" ;;
        esac
    fi
}

CURRENT_SHELL="$(detect_shell)"

# ── Templates ──
prompt_fancy_bash() {
    echo 'PS1="\n\[\e[1;38;5;206m\]╭─\[\e[1;38;5;118m\]\u\[\e[1;38;5;206m\]@\[\e[1;38;5;208m\]\h\[\e[1;38;5;206m\] ─\[\e[1;38;5;118m\][\w]\[\e[1;38;5;206m\]\n╰─\[\e[1;38;5;118m\]Ⓜ\[\e[1;38;5;208m\]➤ \[\e[0m\]"'
}
prompt_fancy_zsh() {
    echo 'PROMPT=$'"'"'%F{206}╭─%F{118}%n%F{206}@%F{208}%m%F{206} ─%F{118}[%~]%F{206}\n╰─%F{118}Ⓜ%F{208}➤ %f'"'"''
}

prompt_epic_bash() {
    echo 'PS1="\n\[\e[1;38;5;208m\]┌──[\[\e[1;38;5;206m\]\u\[\e[1;38;5;208m\]@\[\e[1;38;5;118m\]\h\[\e[1;38;5;208m\]]──[\[\e[1;38;5;118m\]\w\[\e[1;38;5;208m\]]\n└──\[\e[1;38;5;118m\]Ⓜ\[\e[1;38;5;208m\]► \[\e[0m\]"'
}
prompt_epic_zsh() {
    echo 'PROMPT=$'"'"'%F{208}\n┌──[%F{206}%n%F{208}@%F{118}%m%F{208}]──[%F{118}%~%F{208}]\n└──%F{118}Ⓜ%F{208}► %f'"'"''
}

prompt_classic_bash() {
    cat << 'EOF'
BANNER_CC="${BANNER_CC:-$(locale 2>/dev/null | awk -F= '/LC_ADDRESS|LANG/ {gsub(/[.@].*/,"",$2); split($2,a,"_"); print a[2]}' | head -1)}"
[ -z "$BANNER_CC" ] && BANNER_CC="US"
PS1='\n\[\e[1;38;5;208m\]╭─\[\e[1;38;5;118m\][\w]\[\e[1;38;5;208m\]───\[\e[1;38;5;206m\][${BANNER_CC}]\[\e[1;38;5;208m\]───\[\e[1;38;5;118m\][\D{%Y}]\[\e[0m\]\n\[\e[1;38;5;208m\]│\[\e[0m\]\n\[\e[1;38;5;208m\]╰─\[\e[1;38;5;118m\]Ⓜ\[\e[1;38;5;208m\]──►\[\e[0m\] '
EOF
}
prompt_classic_zsh() {
    cat << 'EOF'
BANNER_CC="${BANNER_CC:-$(locale 2>/dev/null | awk -F= '/LC_ADDRESS|LANG/ {gsub(/[.@].*/,"",$2); split($2,a,"_"); print a[2]}' | head -1)}"
[ -z "$BANNER_CC" ] && BANNER_CC="US"
PROMPT=$'%F{208}\n╭─%F{118}[%~]%F{208}───%F{206}['"${BANNER_CC}"']%F{208}───%F{118}[%D{%Y}]%f\n%F{208}│%f\n%F{208}╰─%F{118}Ⓜ%F{208}──►%f '
EOF
}

prompt_hacker_bash() {
    echo 'PS1="\[\e[1;32m\][\[\e[1;38;5;118m\]\t\[\e[1;32m\]]─[\[\e[1;38;5;118m\]\u\[\e[1;32m\]]─[\[\e[1;38;5;118m\]\w\[\e[1;32m\]]\n\[\e[1;32m\]└──╼ \[\e[1;38;5;118m\]Ⓜ \[\e[1;38;5;118m\]\$ \[\e[0m\]"'
}
prompt_hacker_zsh() {
    echo 'PROMPT=$'"'"'%F{green}[%F{118}%*%F{green}]─[%F{118}%n%F{green}]─[%F{118}%~%F{green}]\n%F{green}└──╼ %F{118}Ⓜ $ %f'"'"''
}

# Ninja — Option B (user only, no host)
prompt_ninja_bash() {
    echo 'PS1="\[\e[1;38;5;118m\]Ⓜ \[\e[1;38;5;208m\]\u \[\e[1;38;5;118m\][\w]\[\e[1;38;5;208m\] ⟩ \[\e[0m\]"'
}
prompt_ninja_zsh() {
    echo 'PROMPT=$'"'"'%F{118}Ⓜ %F{208}%n %F{118}[%~]%F{208} ⟩ %f'"'"''
}

# ── Generate prompt content ──
generate_prompt() {
    local design="$1"
    local shell="$2"
    local func="${design}_${shell}"

    if declare -f "$func" > /dev/null 2>&1; then
        echo "# T-pro-hybrid — Arrow Design: $design ($shell)"
        echo "# Generated: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "# T-PRO ARROW START"
        "$func"
        echo "# T-PRO ARROW END"
    else
        echo "# ERROR: template $func not found"
        return 1
    fi
}

# ── Preview (shell-aware) ──
preview_prompt() {
    local design="$1"
    local shell="$CURRENT_SHELL"
    local preview_file
    preview_file="$(mktemp)"

    generate_prompt "$design" "$shell" > "$preview_file"

    echo ""
    echo -e "${CYAN}${BOLD}  ─── PREVIEW: ${design^^} (${shell}) ───${RESET}"
    echo ""

    if [ "$shell" = "zsh" ] && command -v zsh >/dev/null 2>&1; then
        zsh -c "source '$preview_file'; printf '  '; printf '%s' \"\$PROMPT\" | cat -v; echo" 2>/dev/null
    else
        bash -c "source '$preview_file'; printf '  '; printf '%s' \"\$PS1\" | cat -v; echo" 2>/dev/null
    fi
    echo ""

    rm -f "$preview_file"
}

# ── Apply ──
apply_prompt() {
    local design="$1"
    local shell="$CURRENT_SHELL"

    generate_prompt "$design" "$shell" > "$PROMPT_FILE"
    chmod +x "$PROMPT_FILE"

    print_success "Prompt design '$design' applied for $shell"
    print_info "File: $PROMPT_FILE"
    print_warning "Restart shell or run: source ~/.tmux-pro-prompt.sh"
}

# ── Current prompt ──
show_current_prompt() {
    echo ""
    echo -e "${CYAN}${BOLD}  ─── CURRENT PROMPT ───${RESET}"
    echo ""
    if [ -f "$PROMPT_FILE" ]; then
        echo -e "  ${PINK}File:${RESET} ${WHITE}$PROMPT_FILE${RESET}"
        echo -e "  ${PINK}Design:${RESET} ${WHITE}$(grep -m1 'Arrow Design:' "$PROMPT_FILE" | sed 's/.*Arrow Design: //')${RESET}"
        echo ""
        echo -e "${WHITE}  ───── Content ─────${RESET}"
        cat "$PROMPT_FILE"
        echo -e "${WHITE}  ───────────────────${RESET}"
    else
        print_warning "No Arrow prompt file yet ($PROMPT_FILE)"
    fi
    echo ""
}

# ── Menu (Pure C) ──
show_arrow_menu() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "   ╔══════════════════════════════════════════════════════════╗"
    echo "   ║                                                          ║"
    echo "   ║        🎨   ARROW / PROMPT DESIGN STUDIO   🎨            ║"
    echo "   ║                                                          ║"
    echo "   ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e "${PINK}${BOLD}  ◤ SHELL ◢ ${LIME}${CURRENT_SHELL}${RESET}   ${PINK}${BOLD}◤ FILE ◢ ${CYAN}~/.tmux-pro-prompt.sh${RESET}   ${PINK}${BOLD}◤ SIGNATURE ◢ ${LIME}Ⓜ${RESET}"
    echo ""

    echo -e "${LIME}${BOLD}  ╔═══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}                                                                 ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}  ${CYAN}${BOLD}⟨ CHOOSE YOUR DESIGN ⟩${RESET}                                        ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}                                                                 ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ╠═══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}                                                                ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 1 ]${RESET}  ${PINK}✨  Fancy${RESET}       ${WHITE}▸ Curved + Ⓜ + ➤${RESET}       ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 2 ]${RESET}  ${MAGENTA}⚔️   Epic${RESET}        ${WHITE}▸ Box + Ⓜ + ►${RESET}          ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 3 ]${RESET}  ${CYAN}📜  Classic${RESET}     ${WHITE}▸ Path + CC + Year + Ⓜ${RESET}  ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 4 ]${RESET}  ${LIME}💻  Hacker${RESET}      ${WHITE}▸ Time + user + Ⓜ + \$${RESET}     ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 5 ]${RESET}  ${ORANGE}🥷  Ninja${RESET}       ${WHITE}▸ Ⓜ + user + path + ⟩${RESET}    ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}                                                                ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◣${RESET}                                                                ${PINK}◢${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ╚═══════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${RED}${BOLD}  ╔═══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}${ORANGE}◤${RESET}                                                                 ${ORANGE}◥${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}${ORANGE}◤${RESET}  ${ORANGE}${BOLD}⟨ ACTIONS ⟩${RESET}                                                  ${ORANGE}◥${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}${ORANGE}◤${RESET}                                                                 ${ORANGE}◥${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ╠═══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${RED}${BOLD}[ P ]${RESET}  ${ORANGE}👁️   Preview All Designs${RESET}                            ${ORANGE}▐${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${RED}${BOLD}[ C ]${RESET}  ${LIME}📌  Show Current Prompt${RESET}                            ${ORANGE}▐${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${RED}${BOLD}[ 0 ]${RESET}  ${RED}❌  Back to Main Menu${RESET}                              ${ORANGE}▐${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}                                                                ${ORANGE}▐${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ║${RESET}${ORANGE}◣${RESET}                                                                ${ORANGE}◢${RESET}${RED}${BOLD}║${RESET}"
    echo -e "${RED}${BOLD}  ╚═══════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -ne "${LIME}${BOLD}  ╭─[${CYAN}arrow@t-pro${LIME}]─[${PINK}Choose Arrow Design..${LIME}]${RESET}\n${LIME}${BOLD}  ╰──► ${RESET}"
}

# ── Loop ──
while true; do
    show_arrow_menu
    IFS= read -r choice

    case "$choice" in
        1) preview_prompt "fancy";   apply_prompt "fancy" ;;
        2) preview_prompt "epic";    apply_prompt "epic" ;;
        3) preview_prompt "classic"; apply_prompt "classic" ;;
        4) preview_prompt "hacker";  apply_prompt "hacker" ;;
        5) preview_prompt "ninja";   apply_prompt "ninja" ;;
        [Pp])
            echo ""
            echo -e "${CYAN}${BOLD}  ══ PREVIEW ALL DESIGNS ══${RESET}"
            for d in fancy epic classic hacker ninja; do
                preview_prompt "$d"
                sleep 1
            done
            echo -ne "${YELLOW}  Press Enter to continue...${RESET}"
            IFS= read -r
            ;;
        [Cc])
            show_current_prompt
            ;;
        0)
            print_info "Returning to main menu..."
            exit 0
            ;;
        *)
            print_warning "Invalid option!"
            sleep 1
            ;;
    esac

    echo ""
    echo -ne "${YELLOW}  Press Enter to continue...${RESET}"
    IFS= read -r
done
