vim9script

# solarized Colorscheme for vim
# Url: maxmx03/dotfiles
# Maintainer: Max Del Canto <github.com/maxmx03>
# License: MIT License

if exists("g:loaded_solarized")
  finish
endif

g:loaded_solarized = 1

hi clear

if exists('syntax_on')
  syntax reset
endif

set termguicolors
g:colors_name = 'solarized'
g:solarized_transparency = get(g:, 'solarized_transparency', false)

g:solarized_polyglot = get(g:, 'solarized_polyglot', false)
g:solarized_ale = get(g:, 'solarized_ale', false)
g:solarized_coc = get(g:, 'solarized_coc', false)
g:solarized_astro = get(g:, 'solarized_astro', false)

if (has('termguicolors') && &termguicolors) || has('gui_running')
  g:terminal_ansi_colors = [
    "#001E26",
    "#DC322F",
    "#859900",
    "#CB4B16",
    "#2AA198",
    "#6C71C4",
    "#2AA198",
    "#93A1A1",
    "#DC322F",
    "#859900",
    "#B58900",
    "#268BD3",
    "#D33682",
    "#268BD3",
    "#839496",
    "#586E75",
    ]
endif



hi Conceal guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#93a1a1 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#93a1a1 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#93a1a1 gui=NONE cterm=NONE
hi CursorColumn guifg=#00151a guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#073642 gui=NONE cterm=NONE
hi Directory guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#001e26 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#839496 guibg=#073642 gui=NONE cterm=NONE
hi FoldColumn guifg=#839496 guibg=#073642 gui=NONE cterm=NONE
hi IncSearch guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#839496 guibg=#001e26 gui=NONE cterm=NONE
if g:solarized_transparency
  hi Normal guifg=#839496 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#839496 guibg=#001e26 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#00151a gui=NONE cterm=NONE
hi NormalFloat guifg=#839496 guibg=#00151a gui=NONE cterm=NONE
if g:solarized_transparency
  hi NormalFloat guifg=#839496 guibg=NONE gui=NONE cterm=NONE
endif
hi FloatBorder guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi! link NormalNC Normal
hi! link Pmenu NormalFloat
hi PmenuSel guifg=#2aa198 guibg=NONE gui=reverse cterm=reverse
hi PmenuSbar guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#2aa198 gui=NONE cterm=NONE
hi Question guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#93a1a1 guibg=#00151a gui=NONE cterm=NONE
hi! link StatusLineNC StatusLine
hi TabLine guifg=#586e75 guibg=#00151a gui=NONE cterm=NONE
hi TabLineFill guifg=#dc322f guibg=#00151a gui=NONE cterm=NONE
hi TabLineSel guifg=#dc322f guibg=#001e26 gui=NONE cterm=NONE
hi Title guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#073642 gui=NONE cterm=NONE
hi! link VisualNOS Visual
hi WarningMsg guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
hi! link WinBar Normal
hi! link WinBarNC WinBar
hi Comment guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
hi! link Character String
hi Constant guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
hi Boolan guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#839496 guibg=NONE gui=NONE cterm=NONE
hi Property guifg=#839496 guibg=NONE gui=NONE cterm=NONE
hi Parameter guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi! link StorageClass Keyword
hi! link Structure Keyword
hi! link Typedef Keyword
hi Special guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
hi! link SpecialComment Keyword
hi! link Debug Keyword
hi Underlined guifg=#849900 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi Added guifg=#859900 guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
if g:solarized_polyglot
  hi! link htmlTag Tag
  hi! link htmlTagN Tag
  hi! link htmlEndTag Tag
  hi! link htmlTagName Tag
  hi! link htmlSpecialTagName Tag
  hi htmlArg guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
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

if g:solarized_ale
  hi ALEErrorSign guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
  hi ALEWarningSign guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
endif

if g:solarized_coc
  hi CocInlayHint guifg=#28431b guibg=NONE gui=NONE cterm=NONE
  hi! link CocInlayHintType CocInlayHint
  hi! link CocInlayHintParameter CocInlayHint
  hi CocFadeOut guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
  hi CocErrorSign guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
  hi CocWarningSign guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
  hi CocInfoSign guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
  hi CocHintSign guifg=#268bd3 guibg=NONE gui=NONE cterm=NONE
  hi! link CocErrorVirtualText CocErrorSign
  hi! link CocWarningVirtualText CocWarningSign
  hi! link CocInfoVirtualText CocInfoSign
  hi! link CocHintVirtualText CocHintSign
endif

if g:solarized_astro
  hi! link jsxTag Tag
  hi! link jsxTagName Tag
  hi! link astroJavaScriptExpression Tag
endif
unlet g:solarized_transparency
unlet g:solarized_polyglot
unlet g:solarized_ale
unlet g:solarized_coc
unlet g:solarized_astro
