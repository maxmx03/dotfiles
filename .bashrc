#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
FNM_PATH="/home/milianor/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi
export EDITOR="vim"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export BROWSER=google-chrome-stable
export FZF_DEFAULT_COMMAND='fd -t f -s -H --strip-cwd-prefix=always'
export FZF_DEFAULT_OPTS="
--border=rounded
--border-label=${USER^}
--header='Find Files'
--bind 'enter:become($EDITOR {})'
--preview 'bat -p -n --color=always {}'
--color=fg+:#e0def4,hl+:#f6c177
--color=fg:#6e6a86,hl:#f6c177
--color=border:#c4a7e7,header:#7aa2f7,gutter:#16161e
--color=spinner:#31748f,info:#9ccfd8
--color=pointer:#9ccfd8,marker:#31748f,prompt:#1a1b26"
export GUM_INPUT_CURSOR_FOREGROUND="#9ccfd8"
export GUM_INPUT_PROMPT_FOREGROUND="#c4a7e7"
export GUM_PAGER_BORDER_FOREGROUND="#9ccfd8"
export GUM_FORMAT_THEME=$HOME/rosepine.json

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-l":ls'
bind -x '"\C-f":telescope'
bind -x '"\C-e":yazi'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias fish="asciiquarium"
alias vi="vim"
alias dot="git dot"
alias atc="tmx attach"

shopt -s histappend

HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups

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

function get_class {
  xprop | grep WM_CLASS | awk '{ print $4 }'
}

export -f wgetcomp
parallel wgetcomp {/} {} ::: "${cmps[@]}"

for comp in "$HOME"/.cmps/*; do
  source "$comp"
done

function vim {
  [ -z "$*" ] && yazi || command vim "$@"
}

if [[ -n $(command -v jump) ]]; then
  eval "$(jump shell --bind=z)"
fi

if [[ -n $(command -v starship) ]]; then
  eval "$(starship init bash)"
fi

if [[ "$TERM" = "xterm-256color" ]]; then
  fastfetch
fi

source "$HOME/.cargo/env"
