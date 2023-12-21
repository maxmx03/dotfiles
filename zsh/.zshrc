source ~/.bash_profile;

sed -i 's/command hash -r/hash -r/g' $NVM_DIR/nvm.sh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "zap-zsh/vim"
plug "MAHcodes/distro-prompt"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Plugins configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#dc322f"

# User configuration
alias ls="exa --long --icons --tree --level=1 -a"
alias find="fd -H -I -i"
alias ll="ls"

neofetch
