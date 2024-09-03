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

sudo pacman -Rns gnome gdm --noconfirm

sleep 5

sudo pacman -Rns $(pacman -Qdtq) --noconfirm

sleep 5

# install paru
sudo pacman -S --needed base-devel
cd "$HOME"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

mv "${HOME}/dotfiles/.config/hypr" ~/.config
mv "${HOME}/dotfiles/.config/waybar" ~/.config
mv "${HOME}/dotfiles/.config/kitty" ~/.config
mv "${HOME}/dotfiles/.config/nvim" ~/.config
mv "${HOME}/dotfiles/.config/rofi" ~/.config
mv "${HOME}/dotfiles/.config/wlogout" ~/.config
mv "${HOME}/dotfiles/.bashrc" "${HOME}/"
mv "${HOME}/dotfiles/wallpapers" "${HOME}/"
mv "${HOME}/dotfiles/.tmux.conf" "${HOME}/"

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
  pamixer
  kitty
  fish
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
  mesa
  xf86-video-amdgpu
  xf86-video-ati
  libva-mesa-driver
  vulkan-radeon
  evince
)

paru -S "${hypr_packages[@]}" --noconfirm

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
  mpv
)

paru -S "${thunar_packages[@]}" --noconfirm

## Install neovim and dependencies
neovim_packages=(
  python-pynvim
  gcc
  fzf
  fd
  ripgrep
  lazygit
)

paru -S "${neovim_packages[@]}" --noconfirm

cd "$HOME"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd "$HOME/WhiteSur-icon-theme"
./install.sh -t purple

# set themes
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-purple-dark"
