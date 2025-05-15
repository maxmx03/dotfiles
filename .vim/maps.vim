vim9script
g:mapleader = "\<Space>"
g:maplocalleader = ','

nmap <leader>w <cmd>update<cr>
nmap q <cmd>quit<cr>
nmap <silent>f =<cr>
nmap <silent>F =G<cr>
nmap <silent>ss <cmd>split<cr>
nmap <silent>sv <cmd>vsplit<cr>
nmap <silent>+ <c-a>
nmap <silent>- <c-x>
nmap <silent><c-e> <c-u>
nmap <leader>m <leader>K
nmap Y y$
nmap <leader>/ gcc<cr>
vmap <leader>/ gc<cr>
nmap <leader>pp <cmd>PlugInstall<cr>
nmap <leader>pc <cmd>PlugClean<cr>

map f <Plug>Sneak_s
map f <Plug>Sneak_S
