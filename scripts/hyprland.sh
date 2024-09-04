#!/bin/bash

declare -l confirm="y"
read -ei "y" -p "You're going to install hyprland, proceed with installation?" confirm

if [[ $confirm == "y" ]]; then
	echo "Installation will proceed."
else
	echo "Installation canceled."
	exit 1
fi

# install paru
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S make --noconfirm
cd "$HOME" || exit
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si

read -ei "y" -p "install dotfiles?" confirm

if [[ $confirm == "y" ]]; then
	for config in ${HOME}/dotfiles/.config/*; do
		mv "${config}" "$HOME/.config/"
	done

	config_files=(
		"$HOME/dotfiles/.bashrc"
		"$HOME/dotfiles/wallpapers"
		"$HOME/dotfiles/.tmux.conf"
	)

	for config in "${config_files[@]}"; do
		mv "$config" "${HOME}/"
	done
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
	paru -S "${amd_packages[@]}"
else
	read -ei "y" -p "install nvidia drivers?" confirm
	nvidia_packages=(
		mesa
		xf86-video-nouveau
		libva-mesa-driver
	)
	[[ $confirm == "y" ]] && paru -S "${nvidia_packages[@]}"
fi

read -ei "y" -p "install hyprland packages?" confirm

if [[ $confirm == "y" ]]; then
	## Install hyprland and dependencies
	hypr_packages=(
		# hyprland
		hyprland-git
		xdg-desktop-portal-hyprland # must have

		# Qt Wayland Support
		qt5-wayland
		qt6-wayland
		mako # notification daemon
		# screensharing
		pipewire
		wireplumber

		polkit-kde-agent # authentication agent
		rofi-lbonn-wayland-git
		network-manager-applet
		swww # wallpaper

		wlogout # logout and shutdown menu

		# sound control
		pavucontrol
		pamixer

		foot       # terminal
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

		evince # pdf reader

		# extra packages bash
		jq
		less
		tree
		slurp # print
		cliphist # clipboard manager
	)

	paru -S "${hypr_packages[@]}" --noconfirm
fi

read -ei "y" -p "install thunar (file manager) packages?" confirm

if [[ $confirm ]]; then
	## Install File Manager and extras
	thunar_packages=(
		thunar
		thunar-archive-plugin
		file-roller
		thunar-media-tags-plugin
		thunar-volman
		gvfs
		grim
		luv-icon-theme-git

		# theme
		adapta-gtk-theme
		qogir-cursor-theme-git

		gnome-disk-utility # disk
		ristretto          # picture viewer
		mpv                # video
		nwg-look
	)
	paru -S "${thunar_packages[@]}" --noconfirm
fi

read -ei "y" -p "install neovim packages?" confirm

if [[ $confirm == "y" ]]; then
	## Install neovim and dependencies
	neovim_packages=(
		neovim
		python-pynvim
		gcc
		fzf
		fd
		ripgrep
		lazygit
	)

	paru -S "${neovim_packages[@]}" --noconfirm
fi

read -ei "y" -p "set gtk,mouse,icon theme?" confirm

if [[ $confirm == 'y' ]]; then
	# set themes
	gsettings set org.gnome.desktop.interface gtk-theme "Adapta-Nokto-Eta"
	gsettings set org.gnome.desktop.wm.preferences theme "Adapta-Nokto-Eta"
	gsettings set org.gnome.desktop.interface cursor-theme "Qogir-cursors"
	gsettings set org.gnome.desktop.interface icon-theme "Luv"
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
	echo "Run: ngw-look, to set your theme"
fi
