if test "$TERM" != "xterm-kitty" 
  set TERM xterm-256color
end

set PATH ~/.nvm/versions/node/v18.15.0/bin $PATH
set PATH ~/.local/share/flutter/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/.config/composer/vendor/bin $PATH

alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"
alias find "fdfind -H -I -i"
alias fd "fdfind"
alias java_set "sudo update-alternatives --config java"

function change_java
  sudo update-alternatives --config java
end

function fish_greeting
  neofetch
end
