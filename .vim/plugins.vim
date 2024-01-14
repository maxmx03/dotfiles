vim9script
plug#begin()
# colorscheme and syntax highlighting
Plug 'joshdick/onedark.vim'

# editor
Plug 'Shougo/defx.nvim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'wsdjeg/dein-ui.vim'
Plug 'junegunn/fzf.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

# coding
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
plug#end()
