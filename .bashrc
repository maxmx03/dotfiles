export EDITOR="nvim"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export FZF_DEFAULT_COMMAND='fd -t f -s --ignore --strip-cwd-prefix=always'
export FZF_DEFAULT_OPTS="
  --tmux=center 
  --border=rounded
  --border-label=${USER^}
  --header='Find Files'
  --bind 'enter:become($EDITOR {})'
  --preview 'eza --icons -a'
  --color=fg+:#d1d7e0,bg+:#1c2128,hl+:#e5c07b
  --color=fg:#9198a1,bg:#1c2128,hl:#e5c07b
  --color=border:#4d5359,header:#d2a8ff,gutter:#1c2128
  --color=spinner:#8ddb8c,info:#6cb6ff
  --color=pointer:#e06c75,marker:#8ddb8c,prompt:#1c2128"


bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-l":ls'
bind -x '"\C-f":fzf'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias python="python3"
alias py="python3 ."
alias lua="luajit"
alias g="lazygit"
alias aquarium="asciiquarium"

shopt -s histappend

HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups

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

if [[ -n $(command -v timer) ]]; then
  source "$HOME/dotfiles/lib/pomodoro.sh"
fi

if [[ -f "$HOME/git-completion.bash" ]]; then
  source "$HOME/git-completion.bash"
else
  wget "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash"
fi
