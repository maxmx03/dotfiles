# Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup.

<img width="2560" height="611" alt="20260414_16h52m57s_grim" src="https://github.com/user-attachments/assets/ad2c12f7-b0b5-4a39-9821-755e15fb75c7" />

## Overview

This repository contains my complete system configuration, featuring a modern Wayland-based desktop environment powered by Hyprland, Waybar, and Wofi. The aesthetic is heavily inspired by the **Kanagawa** color palette.

## Screenshot

<img width="2560" height="1080" alt="20260414_16h52m33s_grim" src="https://github.com/user-attachments/assets/f20126a3-31e2-4cac-a20d-4535440bf374" />
<img width="2549" height="1080" alt="20260414_16h52m28s_grim" src="https://github.com/user-attachments/assets/23b6d34b-2c27-49be-8ad8-fb2cc3bc998e" />
<img width="2560" height="1080" alt="20260414_16h51m16s_grim" src="https://github.com/user-attachments/assets/761c67e2-d300-48aa-bd31-d6eb7dc68fc3" />
<img width="2560" height="1079" alt="20260414_16h51m06s_grim" src="https://github.com/user-attachments/assets/9e01f249-3e93-430b-940b-d98b27430ed2" />
<img width="2560" height="1080" alt="20260414_16h52m37s_grim" src="https://github.com/user-attachments/assets/be13617a-ee50-4fe2-b2eb-f3a2da57aaf5" />

## Components

### Window Manager & Core

- **[Hyprland](https://hyprland.org/)** - Dynamic tiling Wayland compositor
  - Lua-based configuration with custom keybindings and window rules
  - Hyprpaper for wallpaper management
  - Hyprlock / Hypridle for screen locking and idle management
  - Hyprsunset for night light / blue light filter

### Status Bar

- **[Waybar](https://github.com/Alexays/Waybar)** - Highly customizable Wayland bar
  - Workspaces, system tray, clock, and MPD integration
  - Custom styling with Kanagawa-inspired palette

### Launcher

- **[Wofi](https://hg.sr.ht/~scoopta/wofi)** - Wayland-native application launcher
  - Application launcher with images
  - Custom powermenu script with dedicated styling

### Terminal & Shell

- **[Kitty](https://sw.kovidgoyal.net/kitty/)** - Fast, lightweight, and GPU-accelerated terminal
  - Styled with the `kanagawa-wave` theme
  - JetBrains Mono Nerd Font
- **[Bash](https://www.gnu.org/software/bash/)** - Shell with custom aliases and functions
  - [Starship](https://starship.rs/) - Cross-shell prompt
  - [Jump](https://github.com/gsamokovarov/jump) - Directory jumper
- **[Fastfetch](https://github.com/fastfetch-cli/fastfetch)** - System information tool

### Editors & Utilities

- **[Neovim](https://github.com/maxmx03/nvim)** - Advanced text editor (Git Submodule)
- **[Emacs](https://github.com/maxmx03/emacs)** - Extensible text editor (Git Submodule)
- **[Tmux](https://github.com/tmux/tmux)** - Terminal multiplexer with custom configuration
  - TPM, Resurrect, Mode Indicator, Pomodoro Plus
- **[MPV](https://mpv.io/)** - Media player configuration

### Custom Scripts (`.local/bin/`)

- `dot` - Safe git wrapper for bare repo dotfiles management
- `tmx` - Tmux session manager (create, attach, delete)
- `commit` - Interactive git commit with conventional commits via `gum`
- `git_diff` - Enhanced interactive git diff viewer via `gum`
- `wofi-powermenu` - Wofi-based system power menu (Shutdown/Reboot/Suspend/Logout)
- `retro` - Interactive retro gaming launcher for Mednafen (Sega Saturn / PlayStation)

### Game Emulators

- **[Mednafen](https://mednafen.github.io/)** - Portable multi-system emulator
- **[retro](https://raw.githubusercontent.com/maxmx03/dotfiles/refs/heads/main/.local/bin/retro)** - Interactive Bash wrapper to launch Mednafen games via TUI menu
- **[Eden](https://github.com/eden-emulator/eden)** - Nintendo Switch emulator
- Supported Cores:
  - **[Sega Saturn](https://mednafen.github.io/documentation/ss.html)**
  - **[PlayStation](https://mednafen.github.io/documentation/psx.html)**

_Sega Saturn_ (~/.mednafen/mednafen.cfg)

```cfg
; CRT Shader Setup
ss.stretch aspect
ss.shader goat
ss.shader.goat.pat goatron
ss.shader.goat.slen 1
ss.shader.goat.hdiv 0.20
ss.shader.goat.vdiv 0.20

; Raw (Alternative)
ss.shader autoipsharper
ss.stretch aspect_int
ss.videoip 0
```

_PlayStation_ (~/.mednafen/mednafen.cfg)

```cfg
psx.input.port1 dualshock
psx.input.port1.dualshock.axis_scale 1.20

; CRT Shader Setup
psx.stretch aspect
psx.shader goat
psx.shader.goat.pat goatron
psx.shader.goat.slen 1
psx.shader.goat.hdiv 0.15
psx.shader.goat.vdiv 0.15

; Raw (Alternative)
psx.shader autoipsharper
psx.stretch aspect_mult2
psx.videoip 0
```

---

## Installation

### Quick Setup (Bare Repository Method)

1. Clone the repository as a bare repo:

```bash
git clone --bare https://github.com/maxmx03/dotfiles.git ~/.dot.git
git --git-dir=$HOME/.dot.git --work-tree=$HOME checkout -f
git --git-dir=$HOME/.dot.git --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dot.git --work-tree=$HOME submodule update --init --recursive
```

2. Run the installation script:

```bash
chmod u+x .dot.sh
./.dot.sh
```

This script will:

- Install `yay` (AUR helper) if not present
- Install all packages from `pkglist.txt`
- Configure PipeWire audio
- Set gaming-optimized memory limits

## Configuration

### Git Integration

The repository uses a bare repo with the `dot` alias for seamless dotfile management:

```bash
# Already configured in .gitconfig
dot status
dot add <file>
dot commit -m "feat: update configurations"
dot push
```

### Services to Enable

```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber mpd
```

## Theme

- Color Palette: **Kanagawa** (Wave)
- GTK Theme: WhiteSur GTK Theme
- Icon Theme: WhiteSur Icon Theme
- Fonts:
  - JetBrains Mono Nerd Font (terminal)
  - Noto Fonts (main)
  - Montserrat (display)

## File Structure

```text
.
├── .config/
│   ├── emacs/             # Emacs Configuration (Submodule)
│   ├── fastfetch/         # System fetch layout
│   ├── gtk-3.0/           # GTK3 bookmarks and styles
│   ├── gtk-4.0/           # GTK4 settings
│   ├── heroic/            # Heroic Games Launcher
│   ├── hypr/              # Hyprland config, Hyprpaper, Hyprlock, Hypridle
│   ├── kitty/             # Kitty terminal & Kanagawa theme
│   ├── mpv/               # Media player settings
│   ├── nvim/              # Neovim Configuration (Submodule)
│   ├── obs-studio/        # OBS Studio
│   ├── waybar/            # Status bar config & styles
│   └── wofi/              # Application launcher & powermenu
├── .local/bin/            # Custom user scripts
│   ├── commit
│   ├── dot
│   ├── git_diff
│   ├── retro
│   ├── tmx
│   └── wofi-powermenu
├── .bash_profile          # Bash profile (auto-starts Hyprland)
├── .bashrc                # Shell aliases, Starship prompt, Jump
├── .gitconfig             # Global Git settings & dot alias
├── .gitmodules            # Submodule tracking (nvim, emacs)
└── .tmux.conf             # Tmux multiplexer config
```

## Credits

- **Hyprland**: [vaxerski](https://github.com/hyprwm/Hyprland)
- **Waybar**: [Alexays](https://github.com/Alexays/Waybar)
- **Wofi**: [scoopta](https://hg.sr.ht/~scoopta/wofi)
- **Kanagawa**: [enkia](https://github.com/enkia/kanagawa-theme)
- **WhiteSur Theme**: [vinceliuice](https://github.com/vinceliuice/WhiteSur-gtk-theme)

## License

This configuration is shared as-is for reference and inspiration. Feel free to use and modify as needed.
