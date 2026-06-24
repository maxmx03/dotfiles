# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
if [[ "$TERM" = xterm-256color ]]; then
	fastfetch
fi

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

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export MANPAGER='nvim +Man!'
export ZETPATH="$(xdg-user-dir DOCUMENTS)/obsidian/"
export ZETPATH_NOTES="$(xdg-user-dir DOCUMENTS)/obsidian/Notes/"

eval "$(jump shell --bind=z)"
eval "$(starship init bash)"

# fnm
FNM_PATH="/home/maxmx03/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	export PATH="$FNM_PATH:$PATH"
	eval "$(fnm env --shell bash)"
fi
