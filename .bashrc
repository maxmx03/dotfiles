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

export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export ZETPATH="$(xdg-user-dir DOCUMENTS)/obsidian/"
export ZETPATH_NOTES="$(xdg-user-dir DOCUMENTS)/obsidian/Notes/"
