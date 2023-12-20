# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

# Load and initialise completion system
autoload -Uz compinit
compinit

# User configuration
alias ls="exa --long --icons --tree --level=1 -a"
alias find="fd -H -I -i"

set TERM xterm-256color
