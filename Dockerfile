FROM archlinux:latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm zsh

CMD ["/bin/bash"]
