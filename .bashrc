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

HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups

eval "$(jump shell --bind=z)"
eval "$(starship init bash)"

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
