#!/bin/bash

function yay_pkgs {
  sudo pacman -S --needed base-devel --noconfirm
  sudo pacman -S make --noconfirm
  cd "$HOME" || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si
}

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
  CONFIRM="y"
  read -ei "y" -p "Do you want to install golang?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay -S go
  fi
  echo "export PATH=$PATH:$HOME/go/bin" >>$HOME/.bashrc
  echo "Don't forget to run source .bashrc"
fi

if [[ -z $(command -v gum) ]]; then
  echo "Before we continue, we need to install gum"
  CONFIRM="y"
  read -ei "y" -p "Do you want to install gum?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    yay -S go
    go install github.com/charmbracelet/gum@latest
  fi
  echo "Don't forget to run source .bashrc"
fi

if [[ -z $(command -v cargo) ]]; then
  echo "Before we continue, we need to install cargo"
  CONFIRM="y"
  read -ei "y" -p "Do you want to install cargo?" CONFIRM
  if [[ $CONFIRM == "y" ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  echo "Don't forget to run source .bashrc"
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

function confirm {
  gum style --foreground=3 "$1"
  if gum confirm; then
    return 0
  else
    return 1
  fi
}

if [[ ! -d $HOME/.dot.git ]]; then
  if confirm "Do you want to clone dotfiles?"; then
    git clone --bare https://github.com/maxmx03/dotfiles.git $HOME/.dot.git
  fi
fi

function neovim_pkgs {
  PACKAGES=(
    luarocks
    neovim
    neovide
    python-pynvim
    gcc
  )
  yay -S "${PACKAGES[@]}"
  if [[ -n $(command -v cargo) ]]; then
    cargo install tree-sitter-cli
  fi
}

function vim_pkgs {
  PACKAGES=(
    gvim
  )
  yay -S "${PACKAGES[@]}"
  git --git-dir=$HOME/.dot.git --work-tree=$HOME submodule init
  git --git-dir=$HOME/.dot.git --work-tree=$HOME submodule update
}

function tmux_pkgs {
  PACKAGES=(
    tmux
  )
  yay -S "${PACKAGES[@]}"
  if [[ ! -d $HOME/.tmux/plugins ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
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
    xdg-utils
    nwg-look
  )

  yay -S "${PACKAGES[@]}"
  xdg-user-dirs-update
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme "Qogir-cursors"
}

function i3_pkgs {
  PACKAGES=(
    xorg
    xorg-xinit
    xorgproto
    xarchiver

    i3-wm
    i3blocks
    i3lock
    xss-lock # send idle status to systemd
    scrot    # screenshot for i3lock
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
    tumbler
    gvfs # for mobile
    gvfs-afc
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
    arc-gtk-theme
    qogir-cursor-theme
    qogir-icon-theme

    # multimedia, audio, video
    pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    lib32-pipewire
    pavucontrol

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
    zbar        # bar code reader
    imagemagick # zbar needs imagemagick
    gst-plugins-base
    gst-plugins-base-libs
    gst-plugins-ugly
    gstreamer

    mpc      # music
    mpd      # music
    timidity # mpd depedencie
    arandr   # screen
    mpv      # video

    feh # wallpaper
    fastfetch
    xdg-user-dirs
    xdg-utils
    cpupower # tuning cpu frequency
  )
  yay -S "${PACKAGES[@]}"
  echo "exec i3" >$HOME/.xinitrc
  echo "startx
[[ -f ~/.bashrc ]] && . ~/.bashrc" >$HOME/.bash_profile
  if [[ ! -f $HOME/.env ]]; then
    echo "LATITUDE=0
  LONGITUDE=0
  GEMINI_API=0
  " >$HOME/.env
  fi
  xdg-user-dirs-update
}

function utilities_pkgs {
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
    at
    bat
    ffmpeg
    pacman-contrib # perl neovim sudo vim and most important checkupdates
  )
  yay -S "${PACKAGES[@]}"
  [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
}

function amd_pkgs {
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

function main {
  ACTION="$1"

  if [[ -z $ACTION ]]; then
    echo "Please select an action"
    exit 1
  fi

  if [[ $ACTION == "restore_dotfiles" ]]; then
    if confirm "Do you want to restore dotfiles?"; then
      gum style --foreground=3 "Select config files to remove fron staged area"
      git --git-dir=$HOME/.dot.git --work-tree=$HOME difftool --staged --name-only | gum choose --no-limit | xargs git --git-dir=$HOME/.dot.git --work-tree=$HOME restore --staged --

      gum style --foreground=3 "Select config files to be restored"
      git --git-dir=$HOME/.dot.git --work-tree=$HOME difftool --diff-filter=M --name-only | gum choose --no-limit | xargs git --git-dir=$HOME/.dot.git --work-tree=$HOME restore
    fi
  fi

  if [[ $ACTION == "install_packages" ]]; then
    while confirm "Do you want to install dotfiles packages?"; do
      INSTALLATION="$(gum choose i3 hyprland tmux utilities neovim vim amd emacs)"
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
      vim)
        vim_pkgs
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
        if ! confirm "continue?"; then
          exit 0
        fi
        ;;
      esac
      if ! confirm "continue?"; then
        exit 0
      fi
    done

  fi

  if [[ $ACTION == "make_executable" ]]; then
    while confirm "Know we need to config some things, like make scripts executable"; do
      BIN_SCRIPTS="$HOME/.local/bin"
      if [[ -d $BIN_SCRIPTS ]]; then
        gum style --foreground=3 "Select scripts to make executable"
        ls "$BIN_SCRIPTS" | gum choose --no-limit | xargs -I {} chmod u+x "$BIN_SCRIPTS/{}"
      fi

      I3_SCRIPTS="$HOME/.config/i3/scripts"
      if [[ -d $I3_SCRIPTS ]]; then
        gum style --foreground=3 "Select scripts to make executable"
        ls "$I3_SCRIPTS" | gum choose --no-limit | xargs -I {} chmod u+x "$I3_SCRIPTS/{}"
      fi

      POLYBAR_SCRIPTS="$HOME/.config/polybar/scripts"
      if [[ -d $POLYBAR_SCRIPTS ]]; then
        gum style --foreground=3 "Select scripts to make executable"
        ls $POLYBAR_SCRIPTS | gum choose --no-limit | xargs -I {} chmod u+x "$POLYBAR_SCRIPTS/{}"
      fi
      if ! confirm "continue?"; then
        exit 0
      fi
    done

  fi
}

while confirm "Do you want to install dotfiles?"; do
  ACTION="$(gum choose restore_dotfiles install_packages make_executable)"
  case "$ACTION" in
  restore_dotfiles)
    main restore_dotfiles
    ;;
  install_packages)
    main install_packages
    ;;
  make_executable)
    main make_executable
    ;;
  *)
    echo "Unknown action"
    exit 1
    ;;
  esac
done

echo "If you found a bug, please report it to the author or send a pull request"
