### Milianor-dotfiles

# Quick Start

1.  Clone repo:

        git clone https://github.com/maxmx03/milianor-dotfiles.git
        cd milianor-dotfiles

2.  Install kitty

        sudo apt install kitty
        mv .config/kitty ~/.config

3.  Install fish shell\
    Dont forget to install plugin manager: [fisher](https://github.com/jorgebucaran/fisher)

        sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt update
        sudo apt install fish
        sudo apt install neofetch exa
        mv .config/fish ~/.config

4.  Install tmux\
    Dont forget to install plugin manager: [tpm](https://github.com/tmux-plugins/tpm)

        sudo apt install tmux
        mv .tmux.conf ~/
        tmux
        prefix + I
