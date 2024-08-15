export PATH=$PATH:$HOME/go/bin

alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias g="lazygit"

eval "$(starship init bash)"
eval "$(jump shell --bind=z)"
