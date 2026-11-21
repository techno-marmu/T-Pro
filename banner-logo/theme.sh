#!/bin/bash
# Location: $HOME/T-Pro/banner-logo/theme.sh
# TECHONOLOGY BY MARMU (Own Creation)

# Colors
CYAN="\e[1;36m"
GREEN="\e[1;32m"
WHITE="\e[1;37m"
RESET="\e[0m"

# Loading Effect ကို ချိတ်ဆက်ခြင်း
source "$HOME/Banner-Pro/banner-logo/loading-effect.sh"

clear
echo -e "${CYAN}=========================================${RESET}"
echo -e "${GREEN}          SELECT TERMINAL THEME          ${RESET}"
echo -e "${CYAN}=========================================${RESET}"
echo -e "${WHITE}  [1]${RESET} Dracula (Dark) 🧛"
echo -e "${WHITE}  [2]${RESET} GitHub Dark 🐙"
echo -e "${WHITE}  [3]${RESET} Nord (Cool Dark) ❄️"
echo -e "${WHITE}  [4]${RESET} Monokai (Vibrant Dark) 🎨"
echo -e "${WHITE}  [5]${RESET} Tokyo Night (Dark) 🌃"
echo -e "${WHITE}  [6]${RESET} Solarized Light ☀️"
echo -e "${WHITE}  [7]${RESET} GitHub Light 📝"
echo -e "${WHITE}  [8]${RESET} Skip / Keep Current Theme"
echo -e "${CYAN}=========================================${RESET}"
read -p "Select a theme (1-8): " theme_opt

mkdir -p "$HOME/.termux"
THEME_FILE="$HOME/.termux/colors.properties"

case $theme_opt in
    1)
        show_loading "Applying Dracula Theme"
        cat <<EOF > "$THEME_FILE"
background=#282A36
foreground=#F8F8F2
cursor=#F8F8F2
color0=#21222C
color1=#FF5555
color2=#50FA7B
color3=#F1FA8C
color4=#BD93F9
color5=#FF79C6
color6=#8BE9FD
color7=#F8F8F2
color8=#6272A4
color9=#FF6E6E
color10=#69FF94
color11=#FFFFA5
color12=#D6ACFF
color13=#FF92DF
color14=#A4FFFF
color15=#FFFFFF
EOF
        ;;
    2)
        show_loading "Applying GitHub Dark Theme"
        cat <<EOF > "$THEME_FILE"
background=#0d1117
foreground=#b3b1ad
cursor=#b3b1ad
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
color15=#ffffff
EOF
        ;;
    3)
        show_loading "Applying Nord Theme"
        cat <<EOF > "$THEME_FILE"
background=#2E3440
foreground=#D8DEE9
cursor=#D8DEE9
color0=#3B4252
color1=#BF616A
color2=#A3BE8C
color3=#EBCB8B
color4=#81A1C1
color5=#B48EAD
color6=#88C0D0
color7=#E5E9F0
color8=#4C566A
color9=#BF616A
color10=#A3BE8C
color11=#EBCB8B
color12=#81A1C1
color13=#B48EAD
color14=#8FBCBB
color15=#ECEFF4
EOF
        ;;
    4)
        show_loading "Applying Monokai Theme"
        cat <<EOF > "$THEME_FILE"
background=#272822
foreground=#F8F8F2
cursor=#F8F8F2
color0=#272822
color1=#F92672
color2=#A6E22E
color3=#F4BF75
color4=#66D9EF
color5=#AE81FF
color6=#A1EFE4
color7=#F8F8F2
color8=#75715E
color9=#F92672
color10=#A6E22E
color11=#F4BF75
color12=#66D9EF
color13=#AE81FF
color14=#A1EFE4
color15=#F9F8F5
EOF
        ;;
    5)
        show_loading "Applying Tokyo Night Theme"
        cat <<EOF > "$THEME_FILE"
background=#1a1b26
foreground=#c0caf5
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
        ;;
    6)
        show_loading "Applying Solarized Light Theme"
        cat <<EOF > "$THEME_FILE"
background=#fdf6e3
foreground=#657b83
cursor=#586e75
color0=#073642
color1=#dc322f
color2=#859900
color3=#b58900
color4=#268bd2
color5=#d33682
color6=#2aa198
color7=#eee8d5
color8=#002b36
color9=#cb4b16
color10=#586e75
color11=#657b83
color12=#839496
color13=#6c71c4
color14=#93a1a1
color15=#fdf6e3
EOF
        ;;
    7)
        show_loading "Applying GitHub Light Theme"
        cat <<EOF > "$THEME_FILE"
background=#ffffff
foreground=#24292f
cursor=#044289
color0=#24292f
color1=#d73a49
color2=#28a745
color3=#dbab09
color4=#0366d6
color5=#5a32a3
color6=#059862
color7=#6a737d
color8=#959da5
color9=#cb2431
color10=#22863a
color11=#b08800
color12=#005cc5
color13=#5a32a3
color14=#3192aa
color15=#d1d5da
EOF
        ;;
    8|*)
        echo -e "\n${CYAN}[i] Skipped terminal theme. Keeping current colors.${RESET}"
        return
        ;;
esac

termux-reload-settings
