vim9script
plug#begin()

# Colorscheme & syntax highlight
Plug 'rose-pine/vim'
Plug 'sheerun/vim-polyglot'

# editor
Plug 'Shougo/defx.nvim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'hahdookin/miniterm.vim'
Plug 'justinmk/vim-sneak'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wuelnerdotexe/vim-astro'
Plug 'itchyny/lightline.vim'

# coding
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
plug#end()
