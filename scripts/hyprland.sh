#!/bin/bash

read -n1 -p "[ACTION] - Would you like to continue with the install (y/n): " INST

if [[ $INST == "y" ]]; then
    echo "Installation will proceed."
    # Perform installation steps
else
    echo "Installation canceled."
    exit 1
    # Perform cancellation steps or exit the script
fi

# install paru
sudo pacman -S --needed base-devel
cd "$HOME"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

## install stow
paru -S stow

## stow
cd "$HOME/dotfiles"
stow hypr
stow waybar
stow kitty
stow fish
stow fonts
stow rofi
stow Wallpapers

## Install hyprland and dependencies
hypr_packages=(
    hyprland-git
    xdg-desktop-portal-hyprland
    qt5-wayland
    qt6-wayland
    dunst
    mako
    pipewire
    wireplumber
    polkit-kde-agent
    rofi-lbonn-wayland-git
    network-manager-applet
    swww
    wlogout
    pavucontrol
    kitty
    fish
    exa
    neofetch
    jq
    waybar-git
    firefox
    ttf-dejavu
    ttf-liberation
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
)

paru -S "${hypr_packages[@]}"

## Install File Manager and extras
thunar_packages=(
    thunar
    thunar-archive-plugin
    file-roller
    thunar-media-tags-plugin
    thunar-volman
    gvfs
    grim
    slurp
    cliphist
    dracula-gtk-theme
    dracula-cursors
    gnome-disk-utility
    ristretto
    smplayer
    xreader
)

paru -S "${thunar_packages[@]}"

## Install neovim and dependencies
neovim_packages=(
    neovim-git
    python-pynvim
    gcc
    fzf
    fd
    ripgrep
)

paru -S "${neovim_packages[@]}"

cd "$HOME"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd "$HOME/WhiteSur-icon-theme"
./install.sh -t purple

# set themes
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-purple-dark"

echo 'if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi' >> ~/.bashrc
