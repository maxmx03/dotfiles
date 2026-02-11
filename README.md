# Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup.

## Overview

This repository contains my complete system configuration, featuring a modern Wayland-based desktop environment with a custom status bar built using AGS (Aylur's GTK Shell).

## Screenshot

![Desktop Screenshot](./assets/screenshot.png)

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
- **[Fish](https://fishshell.com/)** - Friendly interactive shell
  - Custom "Frozen" theme
  - Profile-specific configurations

### System Tools
- **Tmux** - Terminal multiplexer with custom configuration
- **Rofi** - Application launcher and powermenu
- **MPD** - Music Player Daemon with custom configuration
- **MPV** - Media player configuration

### Custom Scripts (`.local/bin/`)
- `dot` - Safe git wrapper for dotfiles management
- `tmx` - Tmux session manager
- `mk` - Project scaffolding tool
- `commit` - Git commit helper
- `git_diff` - Enhanced git diff viewer
- `power-profiles` - System power profile switcher
- `editorconfig` - Editor configuration generator

## Installation

### Prerequisites
- Arch Linux (or Arch-based distribution)
- `git` and `base-devel` installed

### Quick Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the installation script:
```bash
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
│   ├── fish/          # Fish shell config
│   ├── foot/          # Terminal config
│   ├── hypr/          # Hyprland config
│   ├── mpd/           # Music player daemon
│   ├── mpv/           # Media player
│   └── rofi/          # Application launcher
├── .local/bin/        # Custom scripts
├── .dot.sh            # Installation script
├── pkglist.txt        # Package list
├── .tmux.conf         # Tmux configuration
├── .gitconfig         # Git configuration
└── .bash_profile      # Bash profile
```

## Credits

- **AGS**: [Aylur](https://github.com/Aylur/ags)
- **Hyprland**: [vaxerski](https://github.com/hyprwm/Hyprland)
- **WhiteSur Theme**: [vinceliuice](https://github.com/vinceliuice/WhiteSur-gtk-theme)

## License

This configuration is shared as-is for reference and inspiration. Feel free to use and modify as needed.
