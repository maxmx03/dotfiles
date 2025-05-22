vim9script

if exists("autocommands_loaded")
  finish
endif
g:autocommands_loaded = 1

# markdown
au BufWinEnter *.md,*.mdx {
  set colorcolumn=80
  set textwidth=80
}
au BufWinLeave *.md,*.mdx set colorcolumn=

# autosave
# au InsertLeave <buffer> silent update

unlet g:autocommands_loaded
