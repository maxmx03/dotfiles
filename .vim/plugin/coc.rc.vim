vim9script
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

# Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

# use <c-space> to trigger completion
inoremap <silent><expr> <c-t> coc#refresh()

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
	'coc-markmap',
	'coc-webview',
	'coc-markdown-preview-enhanced',
]
