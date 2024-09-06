if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin

if [[ -n $(command -v eza) ]]; then
  alias ls="eza --icons"
  alias ll="eza --long --icons -a"
else
  [[ -z $(command -v cargo) ]] && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  [[ -n $(command -v cargo) ]] && cargo install eza
fi

alias python="python3"
alias py="python3 ."
alias lua="luajit"

if [[ -n $(command -v lazygit) ]]; then
  alias g="lazygit"
else
  [[ -n $(command -v go) ]] && go install github.com/jesseduffield/lazygit@latest
fi

if [[ -n $(command -v jump) ]]; then
  eval "$(jump shell --bind=z)"
else
  [[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
fi

if [[ -n $(command -v nvim) ]]; then
  alias vim="nvim"
else
  paru -S neovim --noconfirm
fi

if [[ -n $(command -v starship) ]]; then
  eval "$(starship init bash)"
else
  [[ -z $(command -v starship) ]] && paru -S starship --noconfirm
fi

if [[ -n $(command -v gum) ]]; then
  source "$HOME/dotfiles/scripts/dots.sh"
  source "$HOME/dotfiles/scripts/kanban.sh"
  source "$HOME/dotfiles/scripts/notes.sh"
else
  [[ -z $(command -v go) ]] && paru -S go
  [[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
fi

[[ -z $(command -v node) ]] && paru -S nodejs --noconfirm
[[ -z $(command -v npm) ]] && paru -S npm --noconfirm

function open() {
  # to open directory
  # run: xdg-mime default thunar.desktop inode/directory
  xdg-open "$1"
}

function night() {
  [[ -n $(command -v hyprshade) ]] && [[ -z $(hyprshade current) ]] && hyprshade on blue-light-filter
}

function night_off() {
  [[ -n $(hyprshade current) ]] && hyprshade off
}
