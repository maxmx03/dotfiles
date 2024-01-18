vim9script
# copy and past for wayland
nmap <silent><C-f>  <Plug>(coc-format-selected)
xnoremap <silent><C-c> y:call system("wl-copy", @")<CR>
nmap <silent><C-c> v$<C-c>
nmap <Space>/ gcc<CR>
vmap <Space>/ gc<CR>
nmap <silent><C-Right> :bnext<CR>
nmap <silent><C-Left> :bprev<CR>
nmap <silent><C-x> :bd<CR>
nmap <silent>ss :split<CR>
nmap <silent>sv :vsplit<CR>
nmap <silent>+ ^ylp
nmap <silent>- ^x
nmap <silent><Space>t :MinitermToggle<CR>
tmap <silent><Space>t <c-w>:MinitermToggle<CR>
nmap <silent>s <CR><Plug>Sneak_s
nmap <silent>f =<CR>
nmap <silent>F =G<CR>
nmap <silent><F7> :Inspect<CR>
