export EDITOR="vim"
export PATH=$PATH:$HOME/go/bin
export FZF_DEFAULT_COMMAND='fd -t f -s -H --strip-cwd-prefix=always'
export FZF_DEFAULT_OPTS="
  --tmux=center
  --border=rounded
  --border-label=${USER^}
  --header='Find Files'
  --bind 'enter:become($EDITOR {})'
  --preview 'eza --icons -a'
  --color=fg+:#c0caf5,hl+:#ff9e64
  --color=fg:#565f89,hl:#ff9e64
  --color=border:#292e42,header:#7aa2f7,gutter:#16161e
  --color=spinner:#9ece6a,info:#7dcfff
  --color=pointer:#c099ff,marker:#9ece6a,prompt:#1a1b26"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-l":ls'
bind -x '"\C-f":fzf'
bind -x '"\C-e":yazi'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias g="lazygit"
alias python="python3"
alias py="python3 ."
alias lua="luajit"
alias fish="asciiquarium"
alias vi="vim"

shopt -s histappend

HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups

# decorator
function vim {
    [ -z "$*" ] && yazi || command vim "$@"
}

if [[ -n $(command -v jump) ]]; then
  eval "$(jump shell --bind=z)"
fi

if [[ -n $(command -v starship) ]]; then
  eval "$(starship init bash)"
fi

source "$HOME/dotfiles/lib/utils.sh"
source "$HOME/dotfiles/lib/dots.sh"
source "$HOME/dotfiles/lib/tmx.sh"

declare -a cmps=(
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash"
  "https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/go.completion.sh"
  "https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/tmux.completion.sh"
  "https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/bash/docker"
)

function wgetcomp {
  if [[ ! -f "$HOME"/.cmps/"$1" ]]; then
    wget --directory-prefix="$HOME/.cmps" "$2"
  fi
}

export -f wgetcomp
parallel wgetcomp {/} {} ::: "${cmps[@]}"

for comp in "$HOME"/.cmps/*; do
  source "$comp"
done
