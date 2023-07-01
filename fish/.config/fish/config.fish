set TERM xterm-256color

set PATH ~/.cargo/bin $PATH
set PATH /usr/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.nvm/versions/node/v18.16.1/bin $PATH

alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
# alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"
alias find "fdfind -H -I -i"
alias lua "luajit"

function fish_greeting
  neofetch
end
