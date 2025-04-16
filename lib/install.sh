#!/bin/bash

declare -l confirm="y"
read -ei "y" -p "The script will going to install some dependencies, processed? [y/n]" confirm

if [[ $confirm == "y" ]]; then
  echo "Installation will proceed."
else
  echo "Installation canceled."
  exit 1
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
    xclip # x11 clipboard
  )

  yay -S "${neovim_packages[@]}"
fi

read -ei "y" -p "install i3 packages?" confirm

if [[ $confirm == "y" ]]; then
  i3_packages=(
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
    redshift
    mpd
    mpc
  )

  yay -S "${i3_packages[@]}"
  [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
  [[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
fi

read -ei "y" -p "install tmux?" confirm

if [[ $confirm == "y" ]]; then
  yay -S tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
