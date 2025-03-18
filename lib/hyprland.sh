#!/bin/bash

declare -l confirm="y"
read -ei "y" -p "You're going to install hyprland, proceed with installation?" confirm

if [[ $confirm == "y" ]]; then
  echo "Installation will proceed."
else
  echo "Installation canceled."
  exit 1
fi

# install yay
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S make --noconfirm
cd "$HOME" || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si

yay

read -ei "y" -p "install dotfiles?" confirm

if [[ $confirm == "y" ]]; then
  for config in ${HOME}/dotfiles/.config/*; do
    mv "${config}" "$HOME/.config/"
  done

  echo "$HOME/dotfiles/.bashrc" >>"$HOME/.bashrc"
  mv "$HOME/dotfiles/.tmux.conf" "$HOME/"
  mv -f "$HOME/dotfiles/.bash_profile" "$HOME/"
fi

read -ei "y" -p "install amd drivers?" confirm

if [[ $confirm == "y" ]]; then
  amd_packages=(
    mesa
    xf86-video-amdgpu
    xf86-video-ati
    libva-mesa-driver
    vulkan-radeon
  )
  yay -S "${amd_packages[@]}"
else
  read -ei "y" -p "install nvidia drivers?" confirm
  nvidia_packages=(
    mesa
    xf86-video-nouveau
    libva-mesa-driver
  )
  [[ $confirm == "y" ]] && yay -S "${nvidia_packages[@]}"
fi

read -ei "y" -p "install hyprland packages?" confirm

if [[ $confirm == "y" ]]; then
  ## Install hyprland and dependencies
  hypr_packages=(
    hyprland
    xdg-desktop-portal-hyprland # must have

    # Qt Wayland Support
    qt5-wayland
    qt6-wayland
    mako # notification daemon
    # screensharing
    pipewire
    wireplumber
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    alsa-utils
    alsa-plugins

    polkit-gnome # authentication agent
    rofi-lbonn-wayland-git
    network-manager-applet
    swww # wallpaper

    wlogout # logout and shutdown menu

    # sound control
    pavucontrol
    pamixer

    foot       # terminal
    tmux       # terminal multiplexer
    htop       # terminal system monitor
    waybar-git # wayland bar
    cmus       # music
    firefox
    evince # pdf reader

    # fonts
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

    slurp     #screenshot
    grim      #screenshot
    cliphist  # clipboard manager
    hyprshade # shade
  )

  yay -S "${hypr_packages[@]}"
fi

read -ei "y" -p "install nautilus (file manager) packages?" confirm

if [[ $confirm ]]; then
  ## Install File Manager and extras
  nautilus_packages=(
    nautilus # file manager
    gvfs     # for mobile

    gnome-disk-utility # disk
    gnome-software     # applications
    flatpak            # packages
    eog                # picture viewer
    mpv                # video
    alarm-clock-applet # alarm
  )
  yay -S "${nautilus_packages[@]}"
  [[ -n $(command -v flatpak) ]] && sudo flatpak override --filesystem=$HOME
fi

read -ei "y" -p "install neovim packages?" confirm

if [[ $confirm == "y" ]]; then
  ## Install neovim and dependencies
  neovim_packages=(
    neovim
    python-pynvim
    gcc
    ripgrep
    lazygit
    nodejs
    npm
  )

  yay -S "${neovim_packages[@]}"
fi

read -ei "y" -p "install mouse,gtk,icon?" confirm

if [[ $confirm == 'y' ]]; then
  themes_package=(
    sassc # whitesur dependencies
    qogir-cursor-theme-git
    xdg-user-dirs
    xdg-open
    nwg-look
  )

  yay -S "${themes_package[@]}"

  cd "$HOME"
  [[ ! -d "$HOME/WhiteSur-gtk-theme" ]] && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
  cd $HOME/WhiteSur-gtk-theme
  ./install.sh -t grey

  sleep 3

  cd "$HOME"
  [[ ! -d "$HOME/WhiteSur-icon-theme" ]] && https://github.com/vinceliuice/WhiteSur-icon-theme.git
  cd $HOME/WhiteSur-icon-theme
  ./install.sh -t grey

  sleep 3

  rm -rf $HOME/WhiteSur-gtk-theme
  rm -rf $HOME/WhiteSur-icon-theme

  # set themes
  xdg-user-dirs-update
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme "Qogir-cursors"
  echo "Run: ngw-look, to set your theme"
fi

read -ei "y" -p "install bash extra packages?" confirm

if [[ $confirm == "y" ]]; then
  bash_packages=(
    jq
    less
    tree
    go
    eza
    lazygit
    starship
    man
    fzf
    fd
    parallel
  )

  yay -S "${bash_packages[@]}"
  [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
  [[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
fi

read -ei "y" -p "install tmux?" confirm

if [[ $config == "y" ]]; then
  yay -S tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

sudo systemctl enable --user pipewire
sudo systemctl enable --user wireplumber
