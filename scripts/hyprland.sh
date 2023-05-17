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
cd $HOME
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

## install stow
paru -S stow

## stow
cd $HOME/dotfiles
stow hypr
stow waybar
stow kitty
stow fish
stow fonts
stow rofi
stow Wallpapers

## hyprland
paru -S hyprland-git \
    kitty \
    fish \
    dunst \
    mako \
    pipewire \
    wireplumbe \
    pavucontrol \
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt5ct \
    qt6-wayland \
    grim \
    slurp \
    cliphist \
    thunar \
    thunar-archive-plugin \
    file-roller \
    thunar-media-tags-plugin \
    thunar-volman \
    gvfs \
    swww \
    wlogout \
    polkit-kde-agent \
    ristretto \
    evince-light

## install theme
paru -S dracula-gtk-theme dracula-cursors whitesur-icon-theme-git

# set themes
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"

## install fonts
paru -S ttf-dejavu \
    ttf-liberation \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji

## install rofi
paru -S rofi-lbonn-wayland-git

## install waybar
paru -S network-manager-applet \
    jq \
    waybar-hyprland
