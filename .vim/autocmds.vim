vim9script

# markdown
au BufWinEnter *.md set colorcolumn=80
au BufWinLeave *.md set colorcolumn=

# pandoc
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

# autosave
au InsertLeave,TextChanged <buffer> silent update
