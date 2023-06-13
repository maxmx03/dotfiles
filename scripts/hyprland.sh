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

## Array of package names
packages=(
    hyprland-git
    kitty
    fish
    exa
    neofetch
    firefox
    neovim
    dunst
    mako
    pipewire
    wireplumber
    pavucontrol
    xdg-desktop-portal-hyprland
    qt5-wayland
    qt5ct
    qt6-wayland
    grim
    slurp
    cliphist
    thunar
    thunar-archive-plugin
    file-roller
    thunar-media-tags-plugin
    thunar-volman
    gvfs
    swww
    wlogout
    polkit-kde-agent
    ristretto
    evince-light
    dracula-gtk-theme
    dracula-cursors
    whitesur-icon-theme-git
    ttf-dejavu
    ttf-liberation
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    rofi-lbonn-wayland-git
    network-manager-applet
    jq
    sayonara-player
    mpv
    gnome-disk-utility
    waybar-hyprland-git
)

## Install all packages
paru -S "${packages[@]}"

# set themes
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
