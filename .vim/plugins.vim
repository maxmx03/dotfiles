vim9script
plug#begin()

# Colorscheme & syntax highlight
Plug 'n1ghtmare/noirblaze-vim'
Plug 'sheerun/vim-polyglot'

# editor
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'lambdalisue/vim-fern'
Plug 'lambdalisue/vim-fern-renderer-nerdfont'
Plug 'mhinz/vim-startify'
Plug 'lambdalisue/vim-nerdfont'
Plug 't9md/vim-choosewin'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
Plug 'hahdookin/miniterm.vim'
Plug 'justinmk/vim-sneak'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wuelnerdotexe/vim-astro'
Plug 'itchyny/lightline.vim'
Plug 'psliwka/vim-smoothie'

# coding
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
plug#end()
