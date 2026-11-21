#!/data/data/com.termux/files/usr/bin/bash
# ==============================================
# 🖌️  Tmux-Pro — Terminal Theme Selector v4.0
# ==============================================
# Platform: Linux & Termux 
# Themes: GitHub Dark, Dracula, Claude Code Dark,
#         Tokyo Night, Nord, Catppuccin Mocha
# Extra: Current (live palette), Reset
# Dev By MarMu (Own Creation)
# ==============================================

RESET='\033[0m'
BOLD='\033[1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
ORANGE='\033[38;5;208m'
PINK='\033[38;5;206m'
LIME='\033[38;5;118m'
MAGENTA='\033[1;35m'

THEME_FILE="$HOME/.banner-theme.sh"
TERMUX_PROPS="$HOME/.termux/colors.properties"
TERMUX_BACKUP="$HOME/.banner-termux-colors.bak"

print_success() { echo -e "${GREEN}[+] $1${RESET}"; }
print_error()   { echo -e "${RED}[!] Error: $1${RESET}"; }
print_info()    { echo -e "${BLUE}[i] $1${RESET}"; }
print_warning() { echo -e "${YELLOW}[~] $1${RESET}"; }

# ── Theme data ──
theme_github_dark_termux() {
    cat << 'EOF'
# GitHub Dark
foreground=#c9d1d9
background=#0d1117
cursor=#c9d1d9
color0=#484f58
color1=#ff7b72
color2=#3fb950
color3=#d29922
color4=#58a6ff
color5=#bc8cff
color6=#39c5cf
color7=#b1bac4
color8=#6e7681
color9=#ffa198
color10=#56d364
color11=#e3b341
color12=#79c0ff
color13=#d2a8ff
color14=#56d4dd
color15=#f0f6fc
EOF
}

theme_dracula_termux() {
    cat << 'EOF'
# Dracula
foreground=#f8f8f2
background=#282a36
cursor=#f8f8f2
color0=#21222c
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#8be9fd
color7=#f8f8f2
color8=#6272a4
color9=#ff6e6e
color10=#69ff94
color11=#ffffa5
color12=#d6acff
color13=#ff92df
color14=#a4ffff
color15=#ffffff
EOF
}

theme_claude_dark_termux() {
    cat << 'EOF'
# Claude Code Dark
foreground=#e6e6e6
background=#1a1a1a
cursor=#d97757
color0=#2a2a2a
color1=#e06c75
color2=#98c379
color3=#e5c07b
color4=#61afef
color5=#c678dd
color6=#56b6c2
color7=#dcdfe4
color8=#4b5263
color9=#ef596f
color10=#89ca78
color11=#d19a66
color12=#6cb6ff
color13=#d55fde
color14=#56b6c2
color15=#ffffff
EOF
}

theme_tokyo_night_termux() {
    cat << 'EOF'
# Tokyo Night
foreground=#c0caf5
background=#1a1b26
cursor=#c0caf5
color0=#15161e
color1=#f7768e
color2=#9ece6a
color3=#e0af68
color4=#7aa2f7
color5=#bb9af7
color6=#7dcfff
color7=#a9b1d6
color8=#414868
color9=#f7768e
color10=#9ece6a
color11=#e0af68
color12=#7aa2f7
color13=#bb9af7
color14=#7dcfff
color15=#c0caf5
EOF
}

theme_nord_termux() {
    cat << 'EOF'
# Nord
foreground=#d8dee9
background=#2e3440
cursor=#d8dee9
color0=#3b4252
color1=#bf616a
color2=#a3be8c
color3=#ebcb8b
color4=#81a1c1
color5=#b48ead
color6=#88c0d0
color7=#e5e9f0
color8=#4c566a
color9=#bf616a
color10=#a3be8c
color11=#ebcb8b
color12=#81a1c1
color13=#b48ead
color14=#8fbcbb
color15=#eceff4
EOF
}

theme_catppuccin_termux() {
    cat << 'EOF'
# Catppuccin Mocha
foreground=#cdd6f4
background=#1e1e2e
cursor=#f5e0dc
color0=#45475a
color1=#f38ba8
color2=#a6e3a1
color3=#f9e2af
color4=#89b4fa
color5=#f5c2e7
color6=#94e2d5
color7=#bac2de
color8=#585b70
color9=#f38ba8
color10=#a6e3a1
color11=#f9e2af
color12=#89b4fa
color13=#f5c2e7
color14=#94e2d5
color15=#a6adc8
EOF
}

# ── Show current theme (numeric sort fix) ──
show_current_theme() {
    echo ""
    echo -e "${CYAN}${BOLD}  ─── CURRENT THEME ───${RESET}"
    echo ""

    if [ -f "$TERMUX_PROPS" ]; then
        local fg bg
        fg=$(grep -E '^foreground=' "$TERMUX_PROPS" | head -1 | cut -d= -f2)
        bg=$(grep -E '^background=' "$TERMUX_PROPS" | head -1 | cut -d= -f2)

        echo -e "  ${PINK}Source:${RESET}  ${WHITE}$TERMUX_PROPS${RESET}"
        echo -e "  ${PINK}FG:${RESET}      ${WHITE}${fg:-unknown}${RESET}"
        echo -e "  ${PINK}BG:${RESET}      ${WHITE}${bg:-unknown}${RESET}"
        echo -e "  ${PINK}Palette:${RESET}"

        # Numeric sort via seq 0 15
        local i line col r g b
        for i in $(seq 0 15); do
            line=$(grep -E "^color${i}=" "$TERMUX_PROPS" | head -1)
            [ -z "$line" ] && continue
            col=$(echo "$line" | cut -d= -f2)
            r=$((16#${col:1:2}))
            g=$((16#${col:3:2}))
            b=$((16#${col:5:2}))
            printf "    \033[48;2;%d;%d;%dm      \033[0m  color%-2d %s\n" \
                "$r" "$g" "$b" "$i" "$col"
        done
        echo ""
    else
        print_warning "No colors.properties found (Termux only)"
    fi

    if [ -f "$THEME_FILE" ]; then
        echo -e "  ${PINK}Saved name:${RESET} ${WHITE}$(cat "$THEME_FILE")${RESET}"
    else
        echo -e "  ${PINK}Saved name:${RESET} ${YELLOW}(none)${RESET}"
    fi
    echo ""
}

backup_current_colors() {
    if [ -f "$TERMUX_PROPS" ] && [ ! -f "$TERMUX_BACKUP" ]; then
        cp -p "$TERMUX_PROPS" "$TERMUX_BACKUP"
        print_info "Backed up current colors → $TERMUX_BACKUP"
    fi
}

reset_theme() {
    echo ""
    print_warning "This will restore the original Termux colors (if backup exists)."
    IFS= read -r -p "  👉 Continue? (Y/N): " ans
    if [[ ! "$ans" =~ ^[Yy] ]]; then
        print_info "Cancelled."
        return
    fi

    if [ -f "$TERMUX_BACKUP" ]; then
        cp -p "$TERMUX_BACKUP" "$TERMUX_PROPS"
        command -v termux-reload-settings >/dev/null 2>&1 && termux-reload-settings 2>/dev/null
        rm -f "$TERMUX_BACKUP" "$THEME_FILE"
        print_success "Original theme restored"
    else
        print_warning "No backup found. Removing colors.properties..."
        rm -f "$TERMUX_PROPS"
        command -v termux-reload-settings >/dev/null 2>&1 && termux-reload-settings 2>/dev/null
        rm -f "$THEME_FILE"
        print_success "Reset to system default"
    fi
}

preview_theme() {
    local theme="$1"
    echo ""
    echo -e "${CYAN}${BOLD}  ─── PREVIEW: ${theme} ───${RESET}"
    echo ""
    echo -e "  \033[38;5;196m███ \033[38;5;208m███ \033[38;5;226m███ \033[38;5;46m███ \033[38;5;51m███ \033[38;5;27m███ \033[38;5;129m███ \033[38;5;201m███${RESET}"
    echo -e "  ${WHITE}Normal${RESET}  ${BOLD}Bold${RESET}  ${RED}Red${RESET}  ${GREEN}Green${RESET}  ${YELLOW}Yellow${RESET}  ${BLUE}Blue${RESET}  ${MAGENTA}Magenta${RESET}  ${CYAN}Cyan${RESET}"
    echo ""
}

apply_theme() {
    local theme_name="$1"
    local theme_func="$2"

    if ! declare -f "$theme_func" >/dev/null 2>&1; then
        print_error "Theme function $theme_func not found"
        return 1
    fi

    backup_current_colors

    if [ -d "$HOME/.termux" ]; then
        "$theme_func" > "$TERMUX_PROPS"
        command -v termux-reload-settings >/dev/null 2>&1 && termux-reload-settings 2>/dev/null
        print_success "Theme '$theme_name' applied to Termux"
    else
        print_warning "Termux colors.properties not found (Linux?)"
    fi

    echo "$theme_name" > "$THEME_FILE"
    print_info "Theme name saved: $THEME_FILE"
}

# ── Menu ──
show_theme_menu() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "   ╔══════════════════════════════════════════════════════════╗"
    echo "   ║                                                          ║"
    echo "   ║        🖌️   TERMINAL THEME STUDIO   🖌️                   ║"
    echo "   ║                                                          ║"
    echo "   ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e "${PINK}${BOLD}  ◤ SYS.STATUS ◢ ${GREEN}● ONLINE${RESET}   ${PINK}${BOLD}◤ THEMES ◢ ${CYAN}6${RESET}   ${PINK}${BOLD}◤ CURRENT ◢ ${YELLOW}$(cat "$THEME_FILE" 2>/dev/null || echo "default")${RESET}"
    echo ""

    echo -e "${LIME}${BOLD}  ╔═══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}                                                                 ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}  ${CYAN}${BOLD}⟨ POPULAR THEMES ⟩${RESET}                                            ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◤${RESET}                                                                 ${PINK}◥${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ╠═══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}                                                                ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 1 ]${RESET}  ${CYAN}🐙  GitHub Dark${RESET}        ${WHITE}▸ Official GitHub palette${RESET}   ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 2 ]${RESET}  ${CYAN}🧛  Dracula${RESET}            ${WHITE}▸ Classic dark purple${RESET}      ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 3 ]${RESET}  ${CYAN}🤖  Claude Code Dark${RESET}    ${WHITE}▸ Anthropic warm dark${RESET}     ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 4 ]${RESET}  ${CYAN}🌃  Tokyo Night${RESET}        ${WHITE}▸ Neon city blues${RESET}        ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 5 ]${RESET}  ${CYAN}❄️   Nord${RESET}              ${WHITE}▸ Arctic cool tones${RESET}      ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}  ${GREEN}${BOLD}[ 6 ]${RESET}  ${CYAN}🐱  Catppuccin Mocha${RESET}   ${WHITE}▸ Pastel comfort${RESET}         ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}  ${PINK}▌${RESET}                                                                ${PINK}▐${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ║${RESET}${PINK}◣${RESET}                                                                ${PINK}◢${RESET}${LIME}${BOLD}║${RESET}"
    echo -e "${LIME}${BOLD}  ╚═══════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${YELLOW}${BOLD}  ╔═══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}${ORANGE}◤${RESET}                                                                 ${ORANGE}◥${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}${ORANGE}◤${RESET}  ${ORANGE}${BOLD}⟨ CURRENT & ACTIONS ⟩${RESET}                                        ${ORANGE}◥${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}${ORANGE}◤${RESET}                                                                 ${ORANGE}◥${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ╠═══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${GREEN}${BOLD}[ 7 ]${RESET}  ${LIME}📌  Current Theme${RESET}       ${WHITE}▸ Show live palette${RESET}      ${ORANGE}▐${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${GREEN}${BOLD}[ 8 ]${RESET}  ${YELLOW}🔄  Reset to Default${RESET}    ${WHITE}▸ Restore original${RESET}       ${ORANGE}▐${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${GREEN}${BOLD}[ P ]${RESET}  ${ORANGE}👁️   Preview All${RESET}          ${WHITE}▸ Show all palettes${RESET}      ${ORANGE}▐${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}  ${GREEN}${BOLD}[ 0 ]${RESET}  ${RED}❌  Back to Main Menu${RESET}                                   ${ORANGE}▐${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}  ${ORANGE}▌${RESET}                                                                ${ORANGE}▐${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ║${RESET}${ORANGE}◣${RESET}                                                                ${ORANGE}◢${RESET}${YELLOW}${BOLD}║${RESET}"
    echo -e "${YELLOW}${BOLD}  ╚═══════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -ne "${LIME}${BOLD}  ╭─[${CYAN}theme@tmux-pro${LIME}]─[${PINK} Pick the ${LIME}]${RESET}\n${LIME}${BOLD}  ╰──► ${RESET}"
}

# ── Loop ──
while true; do
    show_theme_menu
    IFS= read -r choice

    case "$choice" in
        1) preview_theme "GitHub Dark";      apply_theme "GitHub Dark" "theme_github_dark_termux" ;;
        2) preview_theme "Dracula";          apply_theme "Dracula" "theme_dracula_termux" ;;
        3) preview_theme "Claude Code Dark"; apply_theme "Claude Code Dark" "theme_claude_dark_termux" ;;
        4) preview_theme "Tokyo Night";      apply_theme "Tokyo Night" "theme_tokyo_night_termux" ;;
        5) preview_theme "Nord";             apply_theme "Nord" "theme_nord_termux" ;;
        6) preview_theme "Catppuccin Mocha"; apply_theme "Catppuccin Mocha" "theme_catppuccin_termux" ;;
        7) show_current_theme ;;
        8) reset_theme ;;
        [Pp])
            echo ""
            echo -e "${CYAN}${BOLD}  ══ PREVIEW ALL THEMES ══${RESET}"
            for t in "GitHub Dark" "Dracula" "Claude Code Dark" "Tokyo Night" "Nord" "Catppuccin Mocha"; do
                preview_theme "$t"
                sleep 1
            done
            echo -ne "${YELLOW}  Press Enter to continue...${RESET}"
            IFS= read -r
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
