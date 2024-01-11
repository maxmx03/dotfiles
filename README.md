# Dotfiles

![screenshot](https://github.com/maxmx03/dotfiles/assets/50273941/c01e7405-4b71-4ffd-8d91-75fd370e2e0f)

- [zsh](https://www.zsh.org/) - shell
- [zap](https://github.com/zap-zsh/zap) - zsh plugin manager
- [foot](https://codeberg.org/dnkl/foot/wiki) - Wayland terminal emulator
- [kitty](https://github.com/kovidgoyal/kitty) - GPU based Terminal
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
- [hyprland](https://github.com/hyprwm/Hyprland) - Wayland compositor
- [neofetch](https://github.com/dylanaraps/neofetch) - system info
- [neovim](https://github.com/neovim/neovim) - Vim-based text editor
- [rofi](https://github.com/davatorium/rofi) - Application launcher
- [waybar](https://github.com/Alexays/Waybar) - Wayland bar
- [wlogout](https://github.com/ArtsyMacaw/wlogout) - Wayland logout menu

## Quick start

```bash
git clone git@github.com:maxmx03/dotfiles $HOME/dotfiles
```

### Install dots script

```bash
paru -S zsh fd
echo "source ~/dotfiles/dots.zsh" >> $HOME/.zshrc
```

### Usage

```bash
# example1: dots install nvim
# example2: dots install .tmux.conf
dots install <config>
# dots help to see more commands
```

## Install Zap

Zap is a minimal zsh plugin manager. \
Access [site](https://www.zapzsh.com/) to install Zap

## Previous Commits

- [solarized](https://github.com/maxmx03/dotfiles/tree/ee9828b6b8809840ac8408f6db356fddd14f7abf)
- [tokyonight](https://github.com/maxmx03/dotfiles/tree/8bdfc18aa2014dfd7879522806e65d27c5f92a89)
- [windows-style](https://github.com/maxmx03/dotfiles/tree/1b25c11eb3a0dac516b8da28d8829307e88056a8)
