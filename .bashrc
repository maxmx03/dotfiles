source "$HOME/dotfiles/scripts/dots.sh"
source "$HOME/dotfiles/scripts/notes.sh"
source "$HOME/dotfiles/scripts/z.sh"

alias ls="exa --long --icons --tree --level=1 -a"
alias g="lazygit"

eval "$(starship init bash)"

if [ -z "$TMUX" ]; then
    neofetch
fi
