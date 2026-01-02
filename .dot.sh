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

yay -S --needed - <pkglist.txt

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
systemctl --user enable --now pipewire pipewire-pulse wireplumber
