vim9script
# copy and past for wayland
nmap <C-f>  <Plug>(coc-format-selected)
xnoremap <C-c> y:call system("wl-copy", @")<CR>
nmap <C-c> v$<C-c>
nmap <Space>/ gcc<CR>
nmap <C-Right> :bnext<CR>
nmap <C-Left> :bprev<CR>
nmap <C-x> :bd<CR>
nmap ss :split<CR>
nmap sv :vsplit<CR>
nmap + <C-a>
nmap - <C-x>
nmap <Space>t :MinitermToggle<CR>
tmap <Space>t <c-w>:MinitermToggle<CR>
nmap s gg <CR><Plug>Sneak_s
nmap f gg <CR><Plug>Sneak_s
