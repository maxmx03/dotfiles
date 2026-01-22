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

# pacman -Qen > pkglist.txt # oficial
# pacman -Qem >> pkglist.txt # aur

yay -S --needed - <pkglist.txt

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
systemctl --user enable --now pipewire pipewire-pulse wireplumber mpd atd

# --- Memory otimization for Gaming and Emuladors
sudo mkdir -p /etc/sysctl.d
echo "vm.max_map_count=1048576" | sudo tee /etc/sysctl.d/99-gaming.conf

sudo mkdir -p /etc/security/limits.d
sudo bash -c "cat <<EOF > /etc/security/limits.d/99-gaming.conf
$USER soft memlock unlimited
$USER hard memlock unlimited
EOF"
