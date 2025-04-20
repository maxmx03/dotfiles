vim9script
g:mapleader = "\<Space>"
g:maplocalleader = ','

nmap <leader>w <cmd>update<cr>
nmap <leader>q <cmd>quit<cr>
nmap <leader>e <cmd>Explore<cr>
nmap <silent>f =<CR>
nmap <silent>F =G<CR>
nmap <silent><C-Up> <cmd>bfirst<CR>
nmap <silent><C-Right> <cmd>bnext<CR>
nmap <silent><C-Left> <cmd>bprev<CR>
nmap <silent><C-Down> <cmd>blast<CR>
nmap <silent><C-x> <cmd>bd<CR>
nmap <silent>ss <cmd>split<CR>
nmap <silent>sv <cmd>vsplit<CR>
nmap <silent>+ ^ylp
nmap <silent>- ^x
nmap <silent><c-e> <c-u>
nmap <leader>m <leader>K
nmap <leader>t <cmd>bot terminal<cr>
nmap <silent><c-up> <c-w><c-w>
tmap <silent><c-up> <c-w><c-w>
tmap <leader>t exit<cr>
nmap <leader>/ gcc<CR>
vmap <leader>/ gc<CR>
