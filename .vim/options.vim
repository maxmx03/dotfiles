vim9script
set number
set cursorline
set clipboard=unnamedplus
set autowrite
set autowriteall
set backup
set backupdir=~/.cache/vim/backup
set completeopt=menu,menuone,noselect,noinsert
set conceallevel=2
set formatoptions=jcroqlnt
set fillchars:eob:.
set ignorecase
set laststatus=0
set list
set listchars=tab:→\ ,trail:-,nbsp:+
set pumheight=10
set relativenumber
set shortmess=aCF
set showmode
set smartcase
set nospell
set timeoutlen=700
set textwidth=120
set undodir=~/.cache/vim/undo
set undofile
set updatetime=4000
set virtualedit=block
set wildmode=longest,full
set winminwidth=5
set wrap
set smoothscroll
set shell=bash
set termwinsize=10x0
set scrolloff=4
set sidescrolloff=8
set smarttab
set smartindent
set shiftwidth=4
set softtabstop=4
set noexpandtab
set tabstop=8
set background=dark

&t_SI = "\e[6 q"
&t_EI = "\e[2 q"

if &term == 'xterm-kitty'
    &t_ut = ''
endif

if has('gui')
    set guioptions=
    set guifont=JetBrainsMono\ Nerd\ Font\ 18
endif
