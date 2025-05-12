vim9script

# markdown
au BufWinEnter *.md set colorcolumn=80
au BufWinLeave *.md set colorcolumn=

# autosave
au InsertLeave <buffer> silent update
