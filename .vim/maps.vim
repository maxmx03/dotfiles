vim9script
g:mapleader = "\<Space>"
g:maplocalleader = ','

# update and quit vim
nmap <leader>w <cmd>update<cr>
noremap q <cmd>quit<cr>

nmap <c-f> :edit 

# tabs
nmap <c-up> :tabnew 
nmap <c-right> <cmd>tabnext<cr>
nmap <c-left> <cmd>tabprev<cr>
nmap <c-down> <cmd>tabclose<cr>

# format code
nmap <silent>f =<cr>
nmap <silent>F =G<cr>

# split window
nmap <silent>ss <cmd>split<cr>
nmap <silent>sv <cmd>vsplit<cr>

# increase and decrease a number
nmap <silent>+ <c-a>
nmap <silent>- <c-x>

# move cursor, use with <c-d>: down, <c-e>: up
nmap <silent><c-e> <c-u>

# open man
nmap <leader>m <leader>K

# yank
nmap Y y$

# vim-comment
nmap <leader>/ gcc<cr>
vmap <leader>/ gc<cr>

# vim-plug
nmap <leader>pp <cmd>PlugInstall<cr>
nmap <leader>pc <cmd>PlugClean<cr>

# vim-sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S

# coding
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-reference)
nmap <silent> <leader>ca <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>ch :call CocActionAsync("doHover")<cr>
nmap <silent> <leader>cl <Plug><Plug>(coc-codelens-action)
nmap <silent> <leader>cf <cmd>Format<cr>

# diagnostics
nmap <silent> <leader>dn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>dp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>df <Plug>(coc-fix-current)

# markdown
nmap <silent> <leader>mm <cmd>CocCommand markdown-preview-enhanced.openPreview<cr>
nmap <leader>md :r! zet date<cr>
nmap <leader>mc :r! mk code %:e<cr>
nmap <leader>mt :r! mk table<cr>

# gemini
xnoremap <leader>gt :!gemini table<cr>
xnoremap <leader>gb :!gemini br<cr>
xnoremap <leader>ge :!gemini en<cr>
xnoremap <leader>gg :!gemini grammar<cr>
