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
export BROWSER=google-chrome-stable
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

declare -a cmps=(
	"https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash"
	"https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/go.completion.sh"
	"https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/completions/tmux.completion.sh"
	"https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/bash/docker"
)

function wgetcomp {
	if [[ ! -f "$HOME"/.cache/bash/completions/"$1" ]]; then
		wget --directory-prefix="$HOME/.cache/bash/completions" "$2"
	fi
}

function get_class {
	xprop | grep WM_CLASS | awk '{ print $4 }'
}

export -f wgetcomp
# Tange, O. (2025, November 22). GNU Parallel 20251122 ('Mamdani').
# Zenodo. https://doi.org/10.5281/zenodo.17692695
parallel wgetcomp {/} {} ::: "${cmps[@]}"

for comp in "$HOME"/.cache/bash/completions/*; do
	source "$comp"
done

if [[ -n $(command -v jump) ]]; then
	eval "$(jump shell --bind=z)"
fi

if [[ -n $(command -v starship) ]]; then
	eval "$(starship init bash)"
fi
. "$HOME/.cargo/env"
