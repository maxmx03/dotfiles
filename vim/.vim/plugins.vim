call plug#begin()
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
