vim9script
# copy and past for wayland
nmap <C-f>  <Plug>(coc-format-selected)
xnoremap <C-c> y:call system("wl-copy", @")<CR>
nmap <C-c> v$<C-c>
nmap <Space>; gcc<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabnext<CR>
nmap bx :tabclose<CR>
nmap bo :tabonly<CR>
nmap bb :tabnext<CR>
map <Space>t :tab term ++close<cr>
tmap <Space>t <C-D>
tmap <C-Right> <c-w>:tabnext<CR>
tmap <C-Left> <c-w>:tabnext<CR>
