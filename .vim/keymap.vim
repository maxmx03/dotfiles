vim9script
# copy and past for wayland
nmap <C-f>  <Plug>(coc-format-selected)
xnoremap <C-c> y:call system("wl-copy", @")<CR>
nmap <C-c> v$<C-c>
