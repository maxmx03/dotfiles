vim9script
g:mapleader = "\<Space>"
g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

# nnoremap <silent><space>e :<C-u>Defx -listed -resume
# \ -columns=indent:mark:icon:icons:filename:git:size
# \ -buffer-name=tab`tabpagenr()`
# \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
var defx = ":Defx -listed -resume "
defx = defx .. "-columns=indent:mark:icon:icons:filename:git:size"
g:which_key_map = {
	q: [':quit', 'quit'],
	w: [':write', 'write'],
	u: [':update', 'update'],
	o: [':on', 'only screen'],
	f: [':Files', 'find files'],
	b: [':Buffers', 'find buffers'],
	e: [defx, 'open folder'],
	t: [':term ++rows=10', 'open terminal'],
	p: {
		name: 'plugin manager',
		i: [':PlugInstall', 'plug install'],
		c: [':PlugClean', 'plug clean'],
		u: [':PlugUpdate', 'plug update'],
	},
	c: {
		name: 'code',
		f: ['<Plug>(coc-format-selected)', 'format code'],
		n: ['<Plug>(coc-diagnostic-next)', 'diagnostic next'],
		N: ['<Plug>(coc-diagnostic-prev)', 'diagnostic prev'],
		d: ['<Plug>(coc-definition)', 'defition'],
		i: ['<Plug>(coc-implementation)', 'implementation'],
		r: ['<Plug>(coc-reference)', 'reference'],
		h: [':call CocActionAsync("doHover")', 'show docs'],
		a: ['<Plug>(coc-codeaction-cursor)', 'code action'],
		l: ['<Plug>(coc-codelens-action)', 'code lens action'],
		c: ['<Plug>(coc-fix-current)', 'fix diagnostic'],
	}
}

which_key#register('<Space>', "g:which_key_map")
