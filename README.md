# Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup.

<img width="2560" height="611" alt="20260414_16h52m57s_grim" src="https://github.com/user-attachments/assets/ad2c12f7-b0b5-4a39-9821-755e15fb75c7" />

## Overview

This repository contains my complete system configuration, featuring a modern Wayland-based desktop environment with a custom status bar built using AGS (Aylur's GTK Shell).

## Screenshot

<img width="2560" height="1080" alt="20260414_16h52m33s_grim" src="https://github.com/user-attachments/assets/f20126a3-31e2-4cac-a20d-4535440bf374" />
<img width="2549" height="1080" alt="20260414_16h52m28s_grim" src="https://github.com/user-attachments/assets/23b6d34b-2c27-49be-8ad8-fb2cc3bc998e" />
<img width="2560" height="1080" alt="20260414_16h51m16s_grim" src="https://github.com/user-attachments/assets/761c67e2-d300-48aa-bd31-d6eb7dc68fc3" />
<img width="2560" height="1079" alt="20260414_16h51m06s_grim" src="https://github.com/user-attachments/assets/9e01f249-3e93-430b-940b-d98b27430ed2" />
<img width="2560" height="1080" alt="20260414_16h52m37s_grim" src="https://github.com/user-attachments/assets/be13617a-ee50-4fe2-b2eb-f3a2da57aaf5" />

## Components

### Window Manager

- **[Hyprland](https://hyprland.org/)** - Dynamic tiling Wayland compositor
  - Animated wallpapers support
  - Volume control scripts
  - Custom keybindings and window rules

### Status Bar & Widgets

- **[AGS](https://github.com/Aylur/ags)** - Aylur's GTK Shell
  - Custom bar with workspaces, system tray, and quick settings
  - Powermenu with verification dialog
  - Volume menu and app launcher
  - Calendar and notification popups
  - Wallpaper selector menu

### Terminal & Shell

- **[Foot](https://codeberg.org/dnkl/foot)** - Fast, lightweight Wayland terminal
- **[bash](<https://en-wikipedia-org.translate.goog/wiki/Bash_(Unix_shell)?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=tc>)** - Bourne Again SHell
  - [startship](https://starship.rs/)
  - [jump](https://github.com/gsamokovarov/jump)

### System Tools

- **Tmux** - Terminal multiplexer with custom configuration
- **Rofi** - Application launcher and powermenu
- **MPV** - Media player configuration

### Custom Scripts (`.local/bin/`)

- `dot` - Safe git wrapper for dotfiles management
- `tmx` - Tmux session manager
- `mk` - Project scaffolding tool
- `commit` - Git commit helper
- `git_diff` - Enhanced git diff viewer
- `power-profiles` - System power profile switcher
- `editorconfig` - Editor configuration generator
- `zet` - Zettelkasten note manager

## Installation

### Prerequisites

- Arch Linux (or Arch-based distribution)
- `git` and `base-devel` installed

### Quick Setup

1. Clone the repository:

```bash
git clone --bare https://github.com/maxmx03/dotfiles.git ~/.dot.git
git --git-dir=$HOME/.dot.git --work-tree=$HOME reset --hard
git --git-dir=$HOME/.dot.git --work-tree=$HOME config --local status.showUntrackedFiles no
```

2. Run the installation script:

```bash
chmod u+x .dot.sh
./.dot.sh
```

This script will:

- Install `yay` (AUR helper) if not present
- Install all packages from `pkglist.txt`
- Configure system settings for gaming (memory limits, etc.)
- Enable essential systemd services

### Manual Package Installation

If you prefer to install packages manually:

```bash
# Install yay first
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

# Install all packages
yay -S --needed - < pkglist.txt
```

## Configuration

### Git Integration

The repository uses a special git alias for managing dotfiles:

```bash
# Add this to your .gitconfig
git config --global alias.dot '!git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'
```

Use the `dot` script for safer operations:

```bash
dot status
dot add <file>
dot commit -m "message"
dot push
```

### Services to Enable

```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber mpd atd
```

## Key Features

- **Gaming Optimized**: Includes memory optimizations and limits configuration
- **Modern Wayland Stack**: Full Wayland-native setup with no X11 dependencies
- **Custom Widgets**: Fully customized AGS widgets for system control
- **Development Ready**: Includes Neovim, development tools, and productivity scripts

## Theme

- **GTK Theme**: WhiteSur GTK Theme
- **Icon Theme**: WhiteSur Icon Theme
- **Terminal Theme**: VS Code Dark+
- **Fonts**:
  - Noto Fonts (main)
  - JetBrains Mono Nerd Font (terminal)
  - Montserrat (display)

## File Structure

```
.
├── .config/
│   ├── ags/           # Aylur's GTK Shell config
│   ├── foot/          # Terminal config
│   ├── hypr/          # Hyprland config
│   ├── mpv/           # Media player
│   ├── nvim/          # Text Editor
│   ├── emacs/         # Religion
├── .local/bin/        # Custom scripts
├── .dot.sh            # Installation script
├── pkglist.txt        # Package list
├── .tmux.conf         # Tmux configuration
├── .gitconfig         # Git configuration
└── .bash_profile      # Bash profile
└── .basrc             # Bash configuration
```

## Credits

- **AGS**: [Aylur](https://github.com/Aylur/ags)
- **Hyprland**: [vaxerski](https://github.com/hyprwm/Hyprland)
- **WhiteSur Theme**: [vinceliuice](https://github.com/vinceliuice/WhiteSur-gtk-theme)

## License

This configuration is shared as-is for reference and inspiration. Feel free to use and modify as needed.
