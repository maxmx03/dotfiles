export PATH=$PATH:$HOME/go/bin

if [[ -z $(command -v exa) ]]; then
  alias ls="exa --icons"
  alias ll="exa --long --icons -a"
fi
if [[ -z $(command -v eza) ]]; then
  alias ls="eza --icons"
  alias ll="eza --long --icons -a"
fi
alias g="lazygit"
alias python="python3"
alias py="python3 ."
alias lua="luajit"
[[ -n $(command -v nvim) ]] && alias vim="nvim"
[[ -n $(command -v starship) ]] && eval "$(starship init bash)"
[[ -n $(command -v jump) ]] && eval "$(jump shell --bind=z)"
[[ -n $(command -v gum) ]] && gum style \
  --foreground 37 --border-foreground 37 --border double \
  --align center --margin "1 2" --padding "1 4" \
  "Welcome ${USER}" "Your environment is set up and ready to go. Happy coding!"
