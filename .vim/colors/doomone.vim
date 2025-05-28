vim9script

# doomone Colorscheme for vim
# Url: maxmx03/dotfiles
# Maintainer: Max Del Canto <github.com/maxmx03>
# License: MIT License

if exists("g:loaded_doomone")
  finish
endif

g:loaded_doomone = 1

hi clear

if exists('syntax_on')
  syntax reset
endif

set termguicolors
g:colors_name = 'doomone'
g:doomone_transparency = get(g:, 'doomone_transparency', false)

g:doomone_polyglot = get(g:, 'doomone_polyglot', false)
g:doomone_ale = get(g:, 'doomone_ale', false)
g:doomone_coc = get(g:, 'doomone_coc', false)
g:doomone_astro = get(g:, 'doomone_astro', false)

if (has('termguicolors') && &termguicolors) || has('gui_running')
  g:terminal_ansi_colors = [
    "#282C34",
    "#FF6C6B",
    "#98BE65",
    "#DA8548",
    "#51AFEF",
    "#A9A1E1",
    "#5699AF",
    "#DFDFDF",
    "#FF6C6B",
    "#98BE65",
    "#ECBE7B",
    "#51AFEF",
    "#C678DD",
    "#46D9FF",
    "#BBC2CF",
    "#5B6268",
    ]
endif



hi Conceal guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#5b6268 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#51afef gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#51afef gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#51afef gui=NONE cterm=NONE
hi CursorColumn guifg=#21242b guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#2257A0 gui=NONE cterm=NONE
hi Directory guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#98be65 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#282c34 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#23272e guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#bbc2cf guibg=#3f444a gui=NONE cterm=NONE
hi FoldColumn guifg=#bbc2cf guibg=#3f444a gui=NONE cterm=NONE
hi IncSearch guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#3f444a guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#3f444a guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#3f444a guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#5b6268 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#bbc2cf guibg=#282c34 gui=NONE cterm=NONE
if g:doomone_transparency
  hi Normal guifg=#bbc2cf guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#bbc2cf guibg=#282c34 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#21242b gui=NONE cterm=NONE
hi NormalFloat guifg=#bbc2cf guibg=#21242b gui=NONE cterm=NONE
if g:doomone_transparency
  hi NormalFloat guifg=#bbc2cf guibg=NONE gui=NONE cterm=NONE
endif
hi FloatBorder guifg=#23272e guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi! link NormalNC Normal
hi! link Pmenu NormalFloat
hi PmenuSel guifg=#51afef guibg=NONE gui=reverse cterm=reverse
hi PmenuSbar guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#51afef gui=NONE cterm=NONE
hi Question guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#bbc2cf guibg=#1c1f24 gui=NONE cterm=NONE
hi! link StatusLineNC StatusLine
hi TabLine guifg=#5b6268 guibg=#21242b gui=NONE cterm=NONE
hi TabLineFill guifg=#bbc2cf guibg=#21242b gui=NONE cterm=NONE
hi TabLineSel guifg=#bbc2cf guibg=#282c34 gui=NONE cterm=NONE
hi Title guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#2257A0 gui=NONE cterm=NONE
hi! link VisualNOS Visual
hi WarningMsg guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi! link WinBar Normal
hi! link WinBarNC WinBar
hi Comment guifg=#5b6268 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#98be65 guibg=NONE gui=NONE cterm=NONE
hi! link Character String
hi Constant guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi Boolan guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#bbc2cf guibg=NONE gui=NONE cterm=NONE
hi Property guifg=#bbc2cf guibg=NONE gui=NONE cterm=NONE
hi Parameter guifg=#ddaeeb guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#c678dd guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
hi! link StorageClass Keyword
hi! link Structure Keyword
hi! link Typedef Keyword
hi Special guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#bbc2cf guibg=NONE gui=NONE cterm=NONE
hi! link SpecialComment Keyword
hi! link Debug Keyword
hi Underlined guifg=#51afef guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
hi Added guifg=#98be65 guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#da8548 guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
if g:doomone_polyglot
  hi! link htmlTag Tag
  hi! link htmlTagN Tag
  hi! link htmlEndTag Tag
  hi! link htmlTagName Tag
  hi! link htmlSpecialTagName Tag
  hi htmlArg guifg=#a9a1e1 guibg=NONE gui=NONE cterm=NONE
  hi! link shVariable Constant
  hi! link shDerefSimple Constant
  hi! link shQuote String
  hi! link shFunctionOne Function
  hi! link typescriptVariable Keyword
  hi! link typescriptTypeReference Type
  hi! link typescriptIdentifierName Function
  hi typescriptObjectLiteral guifg=NONE guibg=NONE gui=NONE cterm=NONE
  hi typescriptObjectLabel guifg=NONE guibg=NONE gui=NONE cterm=NONE
  hi! link vimOption Property
  hi! link vimUsrCmd Function
  hi! link vimIsCommand Function
  hi! link vimFunc Function
  hi! link VimUserFunc Function
  hi! link vim9Block Keyword
  hi! link vimEnvvar Parameter
endif

if g:doomone_ale
  hi ALEErrorSign guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
  hi ALEWarningSign guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
endif

if g:doomone_coc
  hi CocInlayHint guifg=#3b6a9c guibg=NONE gui=NONE cterm=NONE
  hi! link CocInlayHintType CocInlayHint
  hi! link CocInlayHintParameter CocInlayHint
  hi CocFadeOut guifg=#5b6268 guibg=NONE gui=NONE cterm=NONE
  hi CocErrorSign guifg=#ECBE7B guibg=NONE gui=NONE cterm=NONE
  hi CocWarningSign guifg=#ff6c6b guibg=NONE gui=NONE cterm=NONE
  hi CocInfoSign guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
  hi CocHintSign guifg=#46D9FF guibg=NONE gui=NONE cterm=NONE
  hi! link CocErrorVirtualText CocErrorSign
  hi! link CocWarningVirtualText CocWarningSign
  hi! link CocInfoVirtualText CocInfoSign
  hi! link CocHintVirtualText CocHintSign
endif

if g:doomone_astro
  hi! link jsxTag Tag
  hi! link jsxTagName Tag
  hi! link astroJavaScriptExpression Tag
endif
unlet g:doomone_transparency
unlet g:doomone_polyglot
unlet g:doomone_ale
unlet g:doomone_coc
unlet g:doomone_astro
