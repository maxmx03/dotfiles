vim9script
g:mapleader = "\<Space>"
g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

g:which_key_map = {
  q: [':quit', ' Quit'],
  Q: ['quitall', '󰩈 Quit neovim'],
  w: [':update', ' Update'],
  o: [':on', 'Only Screen'],
  e: [':Fern . -drawer -toggle', '󰙅 Open File Tree'],
  f: [':Files', ' Search File'],
  m: [':CocCommand markdown-preview-enhanced.openPreview', 'markdown preview'],
  p: {
    name: 'plugin manager',
    i: [':PlugInstall', 'plug install'],
    c: [':PlugClean', 'plug clean'],
    u: [':PlugUpdate', 'plug update'],
  },
  l: {
    name: 'Code',
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
  },
}

which_key#register('<Space>', "g:which_key_map")
