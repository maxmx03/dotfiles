set TERM xterm-256color

set PATH ~/.cargo/bin $PATH
set PATH /usr/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.nvm/versions/node/v18.16.0/bin $PATH

alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
# alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"
alias find "fd -H -I -i"

function fish_greeting
  neofetch
end

function notes
 open https://maxmx03.github.io/notes/
end
