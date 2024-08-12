source "$HOME/dotfiles/scripts/dots.sh"
source "$HOME/dotfiles/scripts/notes.sh"
export PATH=$PATH:$HOME/go/bin

alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias cat="batcat"
alias g="lazygit"

eval "$(starship init bash)"
eval "$(jump shell --bind=z)"

export FZF_DEFAULT_COMMAND='fdfind --type f -H -E .git -E .vscode --strip-cwd-prefix'
export FZF_DEFAULT_OPTS="
  --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
  --color=fg:#908caa,bg:#191724,hl:#ebbcba
  --color=border:#403d52,header:#31748f,gutter:#191724
  --color=spinner:#f6c177,info:#9ccfd8
  --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
