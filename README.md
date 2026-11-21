# T-Pro

## ✨ Features
- 10+ built-in banner arts (Alien, Hacker, Cyber Matrix, ...)
- Interactive banner preview before applying
- Smart Bash + Zsh hook engine with legacy cleanup
- Custom ASCII name generator (figlet + lolcat)
- Arrow prompt design & terminal theme manager
- Safe backup & one-command restore
- A modular Linux/Termux Theme colour Designs, Banner Designs and Arrow Prompt Designs customization toolkit. This is also auto Shell setup function. Up to 10 Theme, Banner and Arrow Prompt Design Options.

## Project architecture

```text
T-Pro/
├── README.md
├── LICENSE
├── main-setup.sh                   
├── install.sh                       ← Quick Setup installer (optional)
└── banner-logo/
    ├── effect.sh
    ├── loading-effect.sh
    ├── arrow-design.sh
    ├── theme.sh
    ├── restore-original.sh
    └── Arts/
        ├── alien.sh
        ├── hacker.sh
        ├── cyber.sh
        ├── wolf.sh
        ├── spider.sh
        ├── bat.sh
        ├── lobster.sh
        ├── matrix-skull.sh
        └── cyber-dragon.sh
```

## Current stage

This repository currently contains working example implementations and ASCII-art samples so the architecture can be tested before further customization.

### Setup

```bash
cd ~/T-Pro
chmod +x banner-setup.sh requirements.sh effect.sh
chmod +x banner-logo/*.sh banner-logo/Arts/*.sh
./requirements.sh
./banner-setup.sh
```

The setup menu supports Bash and Zsh startup hooks and keeps the active banner in `~/.current-banner.sh`.

## Banner modules

- `cyber.sh` — live sci-fi system information, fake digits, scanner/progress effects and terminal bell tone.
- `name.sh` — configurable name banner with optional `figlet`/system information.
- `Arts/*.sh` — self-contained ASCII-art examples that can be replaced later.
- `restore-original.sh` — removes Banner-Pro startup hooks and active banner state.
- `effect.sh` — setup/loading animation only.

## Notes

The ASCII art in `Arts/` is intentionally stored as text inside shell scripts for now. It can later be replaced with dedicated `.txt` assets without changing the overall project architecture.

T-Pro is designed for Termux and uses standard shell utilities plus optional Termux packages.

# 🎨 T-Pro Is Termux Terminal Customizer

Hybrid Edition v5.0 — Banner Preview + Cross-Shell Hooks + Prompt/Theme Manager


## 🚀 Install

```bash
git clone https://github.com/<your-user>/T-Pro.git
cd T-Pro
chmod +x main-setup.sh
bash main-setup.sh
