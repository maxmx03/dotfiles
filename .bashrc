export EDITOR="nvim"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin

alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias python="python3"
alias py="python3 ."
alias lua="luajit"
alias g="lazygit"

if [[ -n $(command -v jump) ]]; then
  eval "$(jump shell --bind=z)"
fi

if [[ -n $(command -v starship) ]]; then
  eval "$(starship init bash)"
fi

if [[ -n $(command -v gum) ]]; then
  source "$HOME/dotfiles/lib/tmx.sh"
  source "$HOME/dotfiles/lib/dots.sh"
  source "$HOME/dotfiles/lib/kanban.sh"
  source "$HOME/dotfiles/lib/notes.sh"
  source "$HOME/dotfiles/lib/utils.sh"
fi
