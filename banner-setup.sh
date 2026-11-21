#!/usr/bin/env bash
# Banner-Pro compatibility launcher.
# The primary setup entry point is banner-setup.sh.

cd "$HOME/T-Pro" 2>/dev/null || {
    printf '\033[1;31m[!] T-Pro directory not found.\033[0m\n'
    exit 1
}

exec bash "$HOME/T-Pro/main-setup.sh"
