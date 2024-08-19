export PATH=$PATH:$HOME/go/bin

alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias g="lazygit"
alias python="python3"
alias py="python3 ."

eval "$(starship init bash)"
eval "$(jump shell --bind=z)"
