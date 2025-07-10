#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
HISTFILESIZE=5000
HISTSIZE=5000
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups
export EDITOR="nvim"
export BROWSER=brave
export FZF_DEFAULT_COMMAND='fd -t f -s -H --strip-cwd-prefix=always'
export FZF_DEFAULT_OPTS="
--border=rounded
--border-label=${USER^}
--header='Find Files'
--bind 'enter:become($EDITOR {})'
--preview 'bat -p -n --color=always {}'"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-f":telescope'
bind -x '"\C-e":nvim'
alias ls="eza --icons"
alias ll="eza --long --icons -a"
shopt -s histappend

CARGO_HOME="$HOME/.cargo"
if [[ -d "$CARGO_HOME" ]]; then
  export PATH="$CARGO_HOME/bin:$PATH"
  source "$HOME/.cargo/env"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
else
  curl -o- https://fnm.vercel.app/install | bash
fi

if [ -z "$FISH_VERSION" ]; then
  fish
fi
