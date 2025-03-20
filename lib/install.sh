#!/bin/bash

declare -l confirm="y"
read -ei "y" -p "You're going to install dotfiles dependencies. (Only for Debian based distros)" confirm

if [[ $confirm == "y" ]]; then
  echo "Installation will proceed."
else
  echo "Installation canceled."
  exit 1
fi

loading 0.3 "preparing to update"

# update
sudo apt update && sudo apt upgrade

read -ei "y" -p "Do you want to install neovim and it's dependencies?" confirm

if [[ $confirm == "y" ]]; then
  loading 0.3 "prearing to add repository"
  sudo add-apt-repository ppa:neovim-ppa/unstable
  loading 0.3 "prearing to update"
  sudo apt update
  loading 0.3 "preparing dependencies"

  ## neovim and dependencies
  neovim_packages=(
    neovim
    python3-dev
    python3-pip
    python3-venv
    gcc
    ripgrep
  )
  sudo apt install "${neovim_packages[@]}"
fi


read -ei "y" -p "Do you want to Install: parallel, eza, parallel etc..?" confirm

if [[ $confirm == "y" ]]; then
  loading 0.3 "preparing to install starship"
  curl -sS https://starship.rs/install.sh | sh

  sleep 3

  terminal_programs=(
    jq
    less
    tree
    eza
    fzf
    fd-find
    parallel
  )

  sudo apt install "${terminal_programs[@]}"
fi

read -ei "y" -p "Do you want to install jump, gum? (go is required)" confirm

if [[ $confirm == "y" ]]; then
 [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
 [[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
 [[ -n $(command -v go) ]] && go install github.com/jesseduffield/lazygit@latest
fi

read -ei "y" -p "Do you want to install: tmux and dependencies?" confirm

if [[ $confirm == "y" ]]; then
  sudo apt install tmux
  loading 0.3 "preparing to clone tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
