# Dotfiles

Personal configuration files for my Gentoo + Sway setup.

<img width="1376" height="1022" alt="Imagem colada" src="https://github.com/user-attachments/assets/8b27a8ff-b1af-40a7-bdd6-671fdee18eff" />

## Overview

This repository contains my complete system configuration, featuring a minimal and high-performance Wayland-based desktop environment powered by Sway, i3status, and Wofi. The aesthetic is heavily inspired by the **Kanagawa** color palette.

## Components

### Window Manager & Core

- **[Sway](https://swaywm.org/)** - i3-compatible Wayland compositor
  - Kanagawa color integration (`kanagawa.conf`)
  - Custom wallpaper and output management
- **[Swaylock](https://github.com/jeffmhubbard/swaylock-effects)** - Fast and secure screen locker

### Status Bar & Launcher

- **i3status** - Lightweight status bar configuration
- **[Wofi](https://hg.sr.ht/~scoopta/wofi)** - Launcher and menu program for Wayland
  - Customized application launcher
  - Custom dynamic stylesheet (`style.css`)
  - Integrated powermenu script with dedicated styling

### Terminal & Shell

- **[Foot](https://codeberg.org/dnkl/foot)** - Fast, lightweight, and native Wayland terminal
  - Styled with the `kanagawa-wave` theme
- **Bash** - Bourne Again SHell (`.bashrc` & `.bash_profile`)
- **Fastfetch** - Modern system information tool

### Editors & Utilities

- **[Neovim](https://github.com/maxmx03/nvim)** - Advanced text editor (tracked as a Git Submodule)
- **[Emacs](https://github.com/maxmx03/emacs)** - Extensible text editor and environment (tracked as a Git Submodule)
- **Tmux** - Terminal multiplexer with custom configuration
- **MPD & MPV** - Music Player Daemon and media player setup

### Custom Scripts (`.local/bin/`)

- `dot` - Safe git wrapper for dotfiles management
- `commit` - Git commit helper automation
- `wofi-powermenu` - Wofi-based system power menu (Shutdown/Reboot/Lock)

---

## Installation

### Quick Setup (Bare Repository Method)

1. Clone the repository as a bare repo:

```bash
git clone --bare [https://github.com/maxmx03/dotfiles.git](https://github.com/maxmx03/dotfiles.git) ~/.dot.git
git --git-dir=$HOME/.dot.git --work-tree=$HOME checkout -f
git --git-dir=$HOME/.dot.git --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dot.git --work-tree=$HOME submodule update --init --recursive
```

## Configuration

Git Integration
The repository uses a custom wrapper script or a standard git alias for managing your dotfiles seamlessly:

```bash
# Add this to your .gitconfig if needed
git config --global alias.dot '!git --git-dir=$HOME/.dot.git --work-tree=$HOME'
```

Alternatively, use the included dot utility script from your `.local/bin/`:

```bash
dot status
dot add <file>
dot commit -m "feat: update configurations"
dot push
```

## Theme

- Color Palette: Kanagawa (Wave)
- GTK 3.0 / 4.0: Configured via local settings.ini and custom gtk.css
- Terminal Theme: Kanagawa-wav

## File Structure

```text
.
├── .config/
│   ├── emacs/             # Emacs Configuration (Submodule)
│   ├── fastfetch/         # System fetch layout
│   ├── foot/              # Foot terminal & Kanagawa theme
│   ├── gtk-3.0/           # GTK3 bookmarks and styles
│   ├── gtk-4.0/           # GTK4 settings
│   ├── i3status/          # Status bar configuration
│   ├── mpd/               # Music Player Daemon
│   ├── mpv/               # Media player settings
│   ├── nvim/              # Neovim Configuration (Submodule)
│   ├── sway/              # Sway WM config, colors & wallpaper
│   ├── swaylock/          # Lockscreen configuration
│   └── wofi/              # Application launcher & powermenu styles
├── .local/bin/            # Custom user scripts
│   ├── commit
│   ├── dot
│   └── wofi-powermenu
├── .bash_profile          # Bash profile environment
├── .bashrc                # Shell aliases and functions
├── .gitconfig             # Global Git settings
├── .gitmodules            # Submodule tracking details
└── .tmux.conf             # Tmux multiplexer config
```
