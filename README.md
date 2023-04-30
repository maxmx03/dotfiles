## Milianor's dotfiles

![suisei](https://user-images.githubusercontent.com/50273941/235331540-6b5296a1-ddb0-490c-91c8-cfb0c1388517.png)

### Quick Start

1.  Install [Stow](https://www.gnu.org/software/stow/manual/)

        pacman -S stow

2.  Clone repo:

        git clone https://github.com/maxmx03/dotfiles.git
        cd dotfiles
        stow config_name

### Config files for

<details>
    <summary>Neovim - Text Editor</summary>

How to install

    paru -S neovim-nightly-bin

Dependencies

    pacman -S python-pynvim gcc fd ripgrep nodejs npm

- [Nerdfonts](https://www.nerdfonts.com/)
- [codicon](https://github.com/microsoft/vscode-codicons)
- [lazygit](https://github.com/jesseduffield/lazygit)

[Repo](https://github.com/neovim/neovim)

</details>

<details>
    <summary>Kitty - Terminal Emulator</summary>

How to install

    pacman -S kitty

Dependencies

    pacman -S fish

- [Jetbrains nerdfonts](https://www.nerdfonts.com/)

[Repo](https://github.com/kovidgoyal/kitty)

</details>

<details>
    <summary>Fish - Shell</summary>

How to install

    pacman -S fish

Dependencies

- [plugin manager](https://github.com/jorgebucaran/fisher)
- [plugins](https://github.com/jorgebucaran/awsm.fish)
- [tide](https://github.com/IlanCosman/tide)

[Repo](https://github.com/fish-shell/fish-shell)

</details>

<details>
    <summary>Tmux - Terminal Multiplexer</summary>

How to install

    pacman -S tmux

Dependencies

- [Plugin manager](https://github.com/tmux-plugins/tpm)

[Repo](https://github.com/tmux/tmux)

</details>

<details>
    <summary>Hyprland - Wayland Compositor</summary>

I highly recommend that you use Archlinux in order to use Hyprland

How to install

    paru -S hyprland-git

Dependencies

     kitty
     dunst
     mako
     pipewire
     wireplumber
     xdg-desktop-portal-hyprland
     qt5-wayland
     qt5ct
     qt6-wayland
     thunar
     thunar-archive-plugin
     thunar-media-tags-plugin
     thunar-volman
     swww

[Repo](https://github.com/hyprwm/Hyprland)

</details>

<details>
    <summary>Waybar - Wayland Bar</summary>

How to install

    paru -S hyprland-git

Dependencies

    waybar-hyprland
    PulseAudio
    waybar-hyprland
    jq

[Waybar](https://github.com/Alexays/Waybar)

</details>

<details>
    <summary>Rofi - Application Launcher</summary>

How to install

    pacman -S rofi

[rofi](https://github.com/davatorium/rofi)

</details>
