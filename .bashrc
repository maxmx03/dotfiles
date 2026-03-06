#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
alias lz="eza --long --icons -a --total-size"

# Prompt personalizada com git
PS1='\[\033[01;32m\]→\[\033[00m\] $(if git rev-parse --git-dir > /dev/null 2>&1; then \
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null); \
    if git diff --quiet 2>/dev/null; then \
        echo -n "[\033[01;34m$branch\033[00m]"; \
    else \
        echo -n "[\033[01;31m$branch*\033[00m]"; \
    fi; \
fi) \[\033[01;34m\W\[\033[00m\] '
HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups

# fnm
FNM_PATH="/home/milianor/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"
export PATH="$HOME/develop/spring-boot-cli/bin:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export EDITOR=nvim

declare -a cmps=(
  "https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/go.completion.sh"
)
function wgetcomp {
  if [[ ! -f "$HOME"/.cache/bash/completions/"$1" ]]; then
    wget --directory-prefix="$HOME/.cache/bash/completions" "$2"
  fi
}
export -f wgetcomp
parallel wgetcomp {/} {} ::: "${cmps[@]}"
for comp in "$HOME"/.cache/bash/completions/*; do
  source "$comp"
done
