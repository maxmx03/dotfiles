# Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup.

<img width="1920" height="524" alt="20260222_19h40m57s_grim" src="https://github.com/user-attachments/assets/bc6882ea-dce6-445c-99a6-d080e5c438fe" />

## Overview

This repository contains my complete system configuration, featuring a modern Wayland-based desktop environment with a custom status bar built using AGS (Aylur's GTK Shell).

## Screenshot

<img width="1920" height="1080" alt="20260222_19h39m51s_grim" src="https://github.com/user-attachments/assets/d12047ac-63cf-4a4e-b308-6692cfd5a050" />
<img width="1920" height="1080" alt="20260222_19h40m07s_grim" src="https://github.com/user-attachments/assets/4a0d50fb-b755-467b-b244-22806c964d4c" />
<img width="1920" height="548" alt="20260222_19h51m05s_grim" src="https://github.com/user-attachments/assets/5b01dbce-7ca8-4002-9931-5a3ae7249d0c" />
<img width="1920" height="369" alt="20260222_19h51m17s_grim" src="https://github.com/user-attachments/assets/e5713bb7-3f60-4ecd-a10e-47995f5d047b" />
<img width="1920" height="1080" alt="20260222_19h42m32s_grim" src="https://github.com/user-attachments/assets/4976523c-640d-4de3-9f0f-09f1c63a1471" />

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
