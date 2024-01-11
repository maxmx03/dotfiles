#!/bin/bash

read -n1 -p "[ACTION] - Would you like to continue with the install (y/n): " INST

if [[ $INST == "y" ]]; then
    echo "Installation will proceed."
else
    echo "Installation canceled."
    exit 1
fi

cd "$HOME"
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
pushd "$HOME/paru"
makepkg -si
popd

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
    pamixer
    kitty
    foot
    chafa
    zsh
    exa
    htop
    jq
    waybar-git
    cmus
    firefox
    ttf-dejavu
    ttf-liberation
    ttf-hanazono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    adobe-source-code-pro-fonts
    adobe-source-sans-fonts
    adobe-source-serif-fonts
    adobe-source-han-sans-otc-fonts
    adobe-source-han-serif-otc-fonts
    ttf-jetbrains-mono-nerd
    ttf-hack-nerd
    vscode-codicons-git
)

paru -S "${hypr_packages[@]}" --noconfirm

echo "Hyprland has been installed, the script is going to install Thunar."
sleep 3

thunar_packages=(
    thunar
    thunar-archive-plugin
    file-roller
    thunar-media-tags-plugin
    thunar-volman
    xdg-user-dirs
    gvfs
    gvfs-mtp
    jmtpfs
    grim
    slurp
    cliphist
    gnome-disk-utility
    ristretto
    mpv
    evince-no-gnome
)

paru -S "${thunar_packages[@]}" --noconfirm

echo "Thunar has been installed, the script is going to install themes, icons, and cursor."
sleep 3

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
pushd "$HOME/WhiteSur-icon-theme"
./install.sh -t red
popd
rm -rf "$HOME/WhiteSur-icon-theme"

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
pushd "$HOME/WhiteSur-gtk-theme"
./install.sh -t red
popd
rm -rf "$HOME/WhiteSur-gtk-theme"

theming_packages=(
    qogir-cursor-theme-git
    nwg-look
)

paru -S "${theming_packages[@]}" --noconfirm

echo "Theming packages have been installed. Run nwg-look after the installation."
sleep 3

echo 'if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi' >> ~/.bashrc
