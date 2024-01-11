source ~/.bash_profile;
# Load Angular CLI autocompletion.
source <(ng completion script)
source ~/dotfiles/dots.zsh

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
plug "zap-zsh/exa"

# Load and initialise completion system
autoload -Uz compinit
compinit

# alias
alias love='love-git'
alias g='lazygit'

# Plugins configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#b392f0"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#ef596f"

if [ -z "$TMUX" ]; then
    neofetch
fi
