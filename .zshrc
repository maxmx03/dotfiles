source ~/.bash_profile;
source ~/dotfiles/dots.zsh
source ~/dotfiles/notes.zsh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "zap-zsh/vim"
plug "MAHcodes/distro-prompt"
plug "zap-zsh/exa"

# Load and initialise completion system
autoload -Uz compinit
compinit -d

# alias
alias g="lazygit"
alias vim="nvim"

# Plugins configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#b392f0"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#ef596f"

if [ "$TERM" = "xterm-256color" ]; then
    if [ -z "$TMUX" ]; then
        neofetch --backend kitty
    fi
else
    if [ -z "$TMUX" ]; then
        neofetch
    fi
fi

if [ -z "$TMUX" ] && [ "$TERM" = "foot" ]; then
    export TERM="xterm-256color"
fi
