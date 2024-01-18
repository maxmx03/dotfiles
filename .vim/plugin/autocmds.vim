vim9script

# markdown
au BufWinEnter *.md set colorcolumn=80
au BufWinLeave *.md set colorcolumn=

# defx
au BufWritePost * :call defx#redraw()
autocmd FileType defx setlocal nonumber
autocmd FileType defx setlocal norelativenumber

# pandoc
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
