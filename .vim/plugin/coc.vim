vim9script

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
def CheckBackspace(): bool
  var col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
enddef

inoremap <silent><expr> <c-@> coc#refresh()

g:coc_global_extensions = [
  'coc-vimlsp',
  'coc-prettier',
  'coc-html',
  'coc-eslint',
  'coc-emmet',
  'coc-tsserver',
  'coc-sumneko-lua',
  'coc-stylua',
  'coc-sh',
  'coc-pyright',
  'coc-json',
  'coc-css',
  'coc-angular',
  'coc-markdownlint',
  'coc-markdown-preview-enhanced',
  'coc-emoji',
  'coc-go',
  '@yaegassy/coc-astro',
  'coc-sh',
  'coc-diagnostic',
  'coc-webview',
  'coc-clangd',
  'coc-rust-analyzer',
]
