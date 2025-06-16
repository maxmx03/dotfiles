#!/bin/bash

if [[ -z $(command -v yay) ]]; then
  echo "Before we continue, we need to install yay"
  CONFIRM="y"
  read -ei "y" -p "Do you want to install yay?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay_pkgs
  fi
fi

if [[ -z $(command -v go) ]]; then
  echo "Before we continue, we need to install golang"
  CONFIRM
  read -ei "y" -p "Do you want to install golang?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay -S go
  fi
  echo "export PATH=$PATH:$HOME/go/bin" >>$HOME/.bashrc
  echo "don't forget to run source .bashrc"
fi

if [[ -z $(command -v gum) ]]; then
  echo "Before we continue, we need to install gum"
  CONFIRM="y"
  read -ei "y" -p "Do you want to install gum?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay -S go
    go install github.com/charmbracelet/gum@latest
  fi
  echo "don't forget to run source .bashrc"
fi

if [[ -z $(command -v git) ]]; then
  echo "Before we continue, we need to install git"
  CONFIRM="y"
  read -ei "y" -p "Do you want to install git?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay -S go
    go install github.com/charmbracelet/gum@latest
  fi
fi

if [[ -z $(command -v git) ]]; then
  echo "Before we continue, we need to clone dotfiles"
  CONFIRM="y"
  read -ei "y" -p "Do you want to clone dotfiles?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    git clone --bare https://github.com/milianor/dotfiles.git $HOME/.dot.git
  fi
fi

function dot {
  git --git-dir=$HOME/.dot.git --work-tree=$HOME
}

function yay_pkgs {
  sudo pacman -S --needed base-devel --noconfirm
  sudo pacman -S make --noconfirm
  cd "$HOME" || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si
}

function neovim_pkgs {
  PACKAGES=(
    luarocks
    neovim
    python-pynvim
    gcc
  )
  yay -S "${PACKAGES[@]}"
}

function tmux_pkgs {
  PACKAGES=(
    tmux
    tmux-plugins
  )
  yay -S "${PACKAGES[@]}"
}

function hypr_pkgs {
  PACKAGES=(
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

    nautilus # file manager
    gvfs     # for mobile

    gnome-disk-utility # disk
    gnome-software     # applications
    flatpak            # packages
    eog                # picture viewer
    mpv                # video
    alarm-clock-applet # alarm

    sassc # whitesur dependencies
    qogir-cursor-theme-git
    xdg-user-dirs
    xdg-open
    nwg-look
  )

  yay -S "${PACKAGES[@]}"
  xdg-user-dirs-update
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme "Qogir-cursors"
}

function i3_pkgs {
  PACKAGES=(
    xorg-fonts-encodings
    xorg-server
    xorg-server-common
    xorg-server-xvfb
    xorg-setxkbmap
    xorg-xauth
    xorg-xbacklight
    xorg-xdpyinfo
    xorg-xinit
    xorg-xinput
    xorg-xkbcomp
    xorg-xkill
    xorg-xmodmap
    xorg-xprop
    xorg-xrandr
    xorg-xrdb
    xorg-xset
    xorgproto

    i3-wm
    i3blocks
    i3lock
    i3status

    polybar        # status bar
    picom          # compositor
    xfce4-terminal # terminal
    kitty          # terminal
    xclip          # clipboard
    polkit         # permissions
    polkit-gnome   # permissions

    # file manager
    thunar
    thunar-archive-plugin
    thunar-volman
    gvfs # for mobile
    gvfs-gphoto2
    gvfs-mtp
    gvfs-nfs
    gvfs-smb
    timeshift          # backup
    gnome-disk-utility # disk
    gnome-screenshot   # screenshot

    # network
    nmap
    networkmanager
    network-manager-applet

    # fonts
    ttf-dejavu
    ttf-liberation
    ttf-hanazono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ttf-hack-nerd
    vscode-codicons-git
    awesome-terminal-fonts
    cantarell-fonts
    ttf-bitstream-vera
    ttf-dejavu
    ttf-jetbrains-mono-nerd
    ttf-liberation
    ttf-opensans

    dbus     # notification daemon
    dunst    # notification
    redshift # daylight
    rofi     # menu

    # theme
    gtk2
    gtk3
    gtk4
    adwaita-cursors
    adwaita-icon-theme
    adwaita-icon-theme-legacy
    adwaita-fonts
    nwg-look

    # multimedia, audio, video
    pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    lib32-pipewire

    # drivers and libraries
    alsa-utils
    alsa-plugins
    alsa-lib
    alsa-firmware
    lib32-alsa-lib
    lib32-alsa-plugins

    # for obs studio
    gst-libav
    gst-plugin-pipewire
    gst-plugins-bad
    gst-plugins-bad-libs
    gst-plugins-base
    gst-plugins-base-libs
    gst-plugins-ugly
    gstreamer

    mpc    # music
    mpd    # music
    arandr # screen
    mpv    # video
    vim    # text editor

    # lock
    imagemagick
    zbar
    magickcache-git
    xss-lock

    feh # wallpaper
  )
  yay -S "${PACKAGES[@]}"
}

function utilities {
  PACKAGES=(
    jq
    less
    tree
    eza
    starship
    man
    fzf
    fd
    parallel
    ripgrep
    curl
    wget
    unzip
    gzip
    at
    bat
    ffmpeg
  )
  yay -S "${PACKAGES[@]}"
  [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
}

function amd {
  AMD_PACKAGES=(
    mesa
    mesa-utils
    xf86-video-amdgpu
    xf86-video-ati
    libva-mesa-driver
    vulkan-radeon
    amd-ucode
    lib32-libva
    lib32-mesa
    lib32-vulkan-icd-loader
    lib32-vulkan-radeon
  )
  yay -S "${AMD_PACKAGES[@]}"
}

function emacs_pkgs {
  PACKAGES=(
    emacs
  )
  yay -S "${PACKAGES[@]}"
}

echo "echo First, select the configuration files you want to keep."
echo "What will happen is that Git will restore the deleted files."
dot difftool --diff-filter=D --name-only | xargs gum choose --no-limit | xargs dot restore

CONTINUE=$(gum input --placeholder "Do you to install dotfiles packages? [y/n]")

while [[ "$CONTINUE" == [yY] ]]; do
  INSTALLATION="$(gum choose i3 hyprland tmux utilities neovim amd emacs)"
  case "$INSTALLATION" in
  i3)
    i3_pkgs
    ;;
  hyprland)
    hypr_pkgs
    ;;
  amd)
    amd_pkgs
    ;;
  neovim)
    neovim_pkgs
    ;;
  tmux)
    tmux_pkgs
    ;;
  utilities)
    utilities_pkgs
    ;;
  emacs)
    emacs_pkgs
    ;;
  *)
    CONTINUE=$(gum input --placeholder "Do you want to install more packages? [y/n]")
    ;;
  esac
  CONTINUE=$(gum input --placeholder "Do you want to install more packages? [y/n]")
done

echo "If you found a bug, please report it to the author or send a pull request"
