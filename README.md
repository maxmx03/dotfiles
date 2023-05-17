## Milianor's dotfiles

![moon](https://user-images.githubusercontent.com/50273941/236974928-91266362-d7a5-46ce-b46b-4253fedc513e.png)

### Install GNU Stow

GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located
in separate directories on the filesystem, and makes them appear to be installed in the same place.

[docs](https://www.gnu.org/software/stow/manual/)\
[tutorial](https://www.youtube.com/watch?v=CxAT1u8G7is)

        pacman -S stow

### Usage

        git clone https://github.com/maxmx03/dotfiles.git $HOME/dotfiles
        cd dotfiles
        stow config_name

### Config files for

<details>
    <summary>Neovim - Text Editor</summary>

How to install

    paru -S neovim-nightly-bin

Extra Packages to install

    paru -S python-pynvim gcc fd ripgrep nodejs npm
    stow fonts

- [codicon](https://github.com/microsoft/vscode-codicons)
- [lazygit](https://github.com/jesseduffield/lazygit)

[Repo](https://github.com/neovim/neovim)

</details>

<details>
    <summary>Vim - Text Editor</summary>

How to install

    paru -S vim 

Extra Packages to install

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

- [Repo](https://github.com/vim/vim)
</details>

<details>
    <summary>Kitty - Terminal Emulator</summary>

How to install

    pacman -S kitty

Extra Packages to Install

    paru -S
    stow fonts

[Repo](https://github.com/kovidgoyal/kitty)

</details>

<details>
    <summary>Fish - Shell</summary>

How to install

    pacman -S fish

Extra

- [plugin manager](https://github.com/jorgebucaran/fisher)
- [plugins](https://github.com/jorgebucaran/awsm.fish)
- [tide](https://github.com/IlanCosman/tide)

[Repo](https://github.com/fish-shell/fish-shell)

</details>

<details>
    <summary>Tmux - Terminal Multiplexer</summary>

How to install

    pacman -S tmux

Extra

- [Plugin manager](https://github.com/tmux-plugins/tpm)

[Repo](https://github.com/tmux/tmux)

</details>

<details>
    <summary>Hyprland - Wayland Compositor</summary>

I highly recommend that you use Archlinux in order to use Hyprland

How to install

    paru -S hyprland-git

Extra Packages to Install

     kitty
     dunst
     mako
     pipewire
     wireplumber
     xdg-desktop-portal-hyprland
     qt5-wayland
     qt5ct
     qt6-wayland
     grim
     slurp
     cliphist
     thunar
     thunar-archive-plugin
     thunar-media-tags-plugin
     thunar-volman
     swww
     wlogout
     evince-light
     polkit-kde-agent

Theme

- [Dracula](https://draculatheme.com/gtk)
- [Mouse](https://www.gnome-look.org/p/1669262/)
- [Icons](https://www.gnome-look.org/p/1405756/)

[Repo](https://github.com/hyprwm/Hyprland)

</details>

<details>
    <summary>Sway - Wayland Compositor</summary>

How to install

    pacman -S sway

Packages

     kitty
     dunst
     mako
     pipewire
     wireplumber
     xdg-desktop-portal-wlr
     xorg-xwayland
     qt5-wayland
     qt5ct
     qt6-wayland
     grim
     slurp
     thunar
     thunar-archive-plugin
     thunar-media-tags-plugin
     thunar-volman
     swww
     wlogout
     polkit-kde-agent

Theme

- [Dracula](https://draculatheme.com/gtk)
- [Mouse](https://www.gnome-look.org/p/1669262/)
- [Icons](https://www.gnome-look.org/p/1405756/)

</details>

<details>
    <summary>Waybar - Wayland Bar</summary>

How to install

    paru -S waybar-hyprland

Extra Packages to Install

    pamixer
    network-manager-applet
    jq

[Waybar](https://github.com/Alexays/Waybar)

</details>

<details>
    <summary>Rofi Wayland - Application Launcher</summary>

How to install

     paru -S rofi-lbonn-wayland-git

[rofi](https://github.com/lbonn/rofi)

</details>

![waybar](https://user-images.githubusercontent.com/50273941/236975009-cb01a4f8-9afb-4a7e-b472-a6718da6c01a.png)
