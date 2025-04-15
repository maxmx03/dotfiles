export EDITOR="nvim"
export PATH=$PATH:$HOME/go/bin
export FZF_DEFAULT_COMMAND='fd -t f -s --ignore --strip-cwd-prefix=always'
export FZF_DEFAULT_OPTS="
  --tmux=center
  --border=rounded
  --border-label=${USER^}
  --header='Find Files'
  --bind 'enter:become($EDITOR {})'
  --preview 'eza --icons -a'
  --color=fg+:#d1d7e0,hl+:#e5c07b
  --color=fg:#9198a1,hl:#e5c07b
  --color=border:#4d5359,header:#d2a8ff,gutter:#1c2128
  --color=spinner:#8ddb8c,info:#6cb6ff
  --color=pointer:#e06c75,marker:#8ddb8c,prompt:#1c2128"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-l":ls'
bind -x '"\C-f":fzf'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias g="lazygit"
alias python="python3"
alias py="python3 ."
alias lua="luajit"
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

source "$HOME/dotfiles/lib/utils.sh"
source "$HOME/dotfiles/lib/dots.sh"
if [[ -n $(command -v gum) ]]; then
  source "$HOME/dotfiles/lib/tmx.sh"
fi

readonly -a completions=(
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash"
  "https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/go.completion.sh"
  "https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/tmux.completion.sh"
  "https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/bash/docker"
)

function wgetcomp {
  [ ! -f "$HOME"/.completions/"$1" ] && wget --directory-prefix="$HOME/.completions" "$2"
}

export -f wgetcomp
parallel wgetcomp {/} {} ::: "${completions[@]}"

for comp in "$HOME"/.completions/*; do
  source "$comp"
done
