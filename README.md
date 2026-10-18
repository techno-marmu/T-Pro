# Banner-Pro

A modular Termux banner and shell startup customization toolkit.

## Project architecture

```text
T-Pro/
├── banner-setup.sh
├── requirements.sh
├── effect.sh
├── README.md
├── main-setup.sh
└── banner-logo/
    ├── restore-original.sh
    ├── cyber.sh
    ├── name.sh
    └── Arts/
        ├── alien.sh
        ├── hacker.sh
        ├── cyber-dragon.sh
        ├── wolf.sh
        ├── matrix-skull.sh
        ├── spider.sh
        ├── bat.sh
        └── lobster.sh
```

## Current stage

This repository currently contains working example implementations and ASCII-art samples so the architecture can be tested before further customization.

### Setup

```bash
cd ~/Banner-Pro
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

Banner-Pro is designed for Termux and uses standard shell utilities plus optional Termux packages.
