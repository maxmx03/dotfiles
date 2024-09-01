#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S make --noconfirm

sleep 3

# install paru
git clone https://aur.archlinux.org/paru.git
[[ -d "$HOME/paru" ]] && cd paru && makepkg -si

sleep 3

cd "$HOME" || exit

declare fonts bspwm neovim

# packages to install
fonts=(
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
bspwm=(
	bspwm
	sxhkd
	dmenu
	xdo
	rxvt-unicode
	xorg-xinit

	# default programs
	vivaldi
	alacritty
	vim
	neovim
	exa

	# amd drivers
	mesa
	xf86-video-amdgpu
	xf86-video-ati
	libva-mesa-driver
	vulkan-radeon

	# thunar
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
	luv-icon-theme-git
	adapta-gtk-theme
	qogir-cursor-theme-git
	gnome-disk-utility
	ristretto
	vlc
	evince-no-gnome
)

neovim=(
	neovim-git
	python-pynvim
	gcc
	fzf
	fd
	ripgrep
	lazygit
	go
)

paru -S "${fonts[@]}" --noconfirm
sleep 3
paru -S "${bspwm[@]}" --noconfirm
sleep 3
paru -S "${neovim[@]}" --noconfirm
sleep 3

# bspwm installation

declare bspwmconfig sxhkdconfig xinitconfig bashprofile
bspwmconfig="$HOME/.config/bspwm"
sxhkdconfig="$HOME/.config/sxhkd"
xinitconfig="$HOME/.xinitrc"
bashprofile="$HOME/.bash_profile"

[[ ! -d "$bspwmconfig" ]] && mkdir "$bspwmconfig"
[[ ! -d "$sxhkdconfig" ]] && mkdir "$sxhkdconfig"
[[ ! -f "$xinitconfig" ]] && touch "$xinitconfig"
[[ ! -f "$bashprofile" ]] && touch "$bashprofile"

sleep 3
install -Dm754 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
sleep 3
echo "exec bspwm" >>"$xinitconfig"
sleep 3
cat <<EOF >>"$HOME/.bash_profile"
if [ -z "\$DISPLAY" ] && [ "\$XDG_VTNR" = 1 ]; then
  exec startx
fi
EOF
sleep 3

# setting thunar theme

gsettings set org.gnome.desktop.interface gtk-theme "Adapta-Nokto-Eta"
gsettings set org.gnome.desktop.wm.preferences theme "Adapta-Nokto-Eta"
gsettings set org.gnome.desktop.interface cursor-theme "Qogir-cursors"
gsettings set org.gnome.desktop.interface icon-theme "Luv"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
