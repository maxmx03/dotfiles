if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

export PATH=$PATH:$HOME/go/bin

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
  [[ -n $(command -v paru) ]] && paru -S neovim --noconfirm
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
  gum style \
    --foreground 37 --border-foreground 37 \
    --align center --margin "1 2" --padding "1 4" \
    "Welcome ${USER}" "Don't forget to use pomodoro and kanban"
else
  [[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
fi

[[ -z $(command -v fnm) ]] && curl -fsSL https://fnm.vercel.app/install | bash
[[ -z $(command -v node) ]] && fnm use --install-if-missing 20
sed -i '/source \/home\/milianor\/dotfiles\/.bashrc/d' ~/.bashrc && echo 'source /home/milianor/dotfiles/.bashrc' >>~/.bashrc
