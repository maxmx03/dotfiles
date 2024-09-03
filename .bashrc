export PATH=$PATH:$HOME/go/bin

if [[ -n $(command -v eza) ]]; then
	alias ls="eza --icons"
	alias ll="eza --long --icons -a"
else
	[[ -n $(command -v cargo) ]] && cargo install eza
fi

alias python="python3"
alias py="python3 ."
alias lua="luajit"

if [[ -n $(command -v lazygit) ]]; then
	alias g="lazygit"
else
	[[ -n $(command -v go) ]] && go install github.com/jesseduffield/lazygit@latest
fi

if [[ -n $(command -v jump) ]]; then
	eval "$(jump shell --bind=z)"
else
	[[ -n $(command -v go) ]] && go install github.com/gsamokovarov/jump@latest
fi

if [[ -n $(command -v nvim) ]]; then
	alias vim="nvim"
else
	[[ -n $(command -v paru) ]] && paru -S neovim --noconfirm
fi

if [[ -n $(command -v starship) ]]; then
	eval "$(starship init bash)"
else
	[[ -z $(command -v starship) ]] && paru -S starship --noconfirm
fi

if [[ -n $(command -v gum) ]]; then
	source "$HOME/dotfiles/scripts/dots.sh"
	source "$HOME/dotfiles/scripts/kanban.sh"
	source "$HOME/dotfiles/scripts/notes.sh"
	gum style \
		--foreground 37 --border-foreground 37 \
		--align center --margin "1 2" --padding "1 4" \
		"Welcome ${USER}" "Don't forget to use pomodoro and kanban"
else
	[[ -n $(command -v go) ]] && go install github.com/charmbracelet/gum@latest
fi

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec Hyprland
fi
