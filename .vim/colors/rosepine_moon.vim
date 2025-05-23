vim9script

# rosepine_moon Colorscheme for vim
# Url: maxmx03/dotfiles
# Maintainer: Max Del Canto <github.com/maxmx03>
# License: MIT License

if exists("g:loaded_rosepine")
  finish
endif

g:loaded_rosepine = 1

hi clear

if exists('syntax_on')
  syntax reset
endif

set termguicolors
g:colors_name = 'rosepine_moon'
g:rosepine_transparency = get(g:, 'rosepine_transparency', false)

g:rosepine_polyglot = get(g:, 'rosepine_polyglot', false)
g:rosepine_ale = get(g:, 'rosepine_ale', false)
g:rosepine_coc = get(g:, 'rosepine_coc', false)
g:rosepine_astro = get(g:, 'rosepine_astro', false)

if (has('termguicolors') && &termguicolors) || has('gui_running')
  g:terminal_ansi_colors = [
    "#232136",
    "#F6C177",
    "#9CCFD8",
    "#EA9A97",
    "#9CCFD8",
    "#908CAA",
    "#908CAA",
    "#EB6F92",
    "#EB6F92",
    "#3E8FB0",
    "#F6C177",
    "#3E8FB0",
    "#EA9A97",
    "#9CCFD8",
    "#E0DEF4",
    "#9CCFD8",
    ]
endif



hi Conceal guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#9ccfd8 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#9ccfd8 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#9ccfd8 gui=NONE cterm=NONE
hi CursorColumn guifg=#393552 guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#44415a gui=NONE cterm=NONE
hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#232136 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#524f67 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#e0def4 guibg=#2a283e gui=NONE cterm=NONE
hi FoldColumn guifg=#e0def4 guibg=#2a283e gui=NONE cterm=NONE
hi IncSearch guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#e0def4 guibg=#232136 gui=NONE cterm=NONE
if g:rosepine_transparency
  hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#e0def4 guibg=#232136 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#393552 gui=NONE cterm=NONE
hi NormalFloat guifg=#e0def4 guibg=#393552 gui=NONE cterm=NONE
if g:rosepine_transparency
  hi NormalFloat guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
endif
hi FloatBorder guifg=#524f67 guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi! link NormalNC Normal
hi! link Pmenu NormalFloat
hi PmenuSel guifg=#9ccfd8 guibg=NONE gui=reverse cterm=reverse
hi PmenuSbar guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#9ccfd8 gui=NONE cterm=NONE
hi Question guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#e0def4 guibg=#2a273f gui=NONE cterm=NONE
hi! link StatusLineNC StatusLine
hi TabLine guifg=#908caa guibg=#393552 gui=NONE cterm=NONE
hi TabLineFill guifg=#908caa guibg=#393552 gui=NONE cterm=NONE
hi TabLineSel guifg=#908caa guibg=#232136 gui=NONE cterm=NONE
hi Title guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#44415a gui=NONE cterm=NONE
hi! link VisualNOS Visual
hi WarningMsg guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi! link WinBar Normal
hi! link WinBarNC WinBar
hi Comment guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi String guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
hi! link Character String
hi Constant guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Boolan guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Property guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Parameter guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi! link StorageClass Keyword
hi! link Structure Keyword
hi! link Typedef Keyword
hi Special guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi! link SpecialComment Keyword
hi! link Debug Keyword
hi Underlined guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Added guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
if g:rosepine_polyglot
  hi! link htmlTag Tag
  hi! link htmlTagN Tag
  hi! link htmlEndTag Tag
  hi! link htmlTagName Tag
  hi! link htmlSpecialTagName Tag
  hi htmlArg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
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

if g:rosepine_ale
  hi ALEErrorSign guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
  hi ALEWarningSign guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
endif

if g:rosepine_coc
  hi CocInlayHint guifg=#9c85b8 guibg=NONE gui=NONE cterm=NONE
  hi! link CocInlayHintType CocInlayHint
  hi! link CocInlayHintParameter CocInlayHint
  hi CocFadeOut guifg=#908caa guibg=NONE gui=NONE cterm=NONE
  hi CocErrorSign guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
  hi CocWarningSign guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
  hi CocInfoSign guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
  hi CocHintSign guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
  hi! link CocErrorVirtualText CocErrorSign
  hi! link CocWarningVirtualText CocWarningSign
  hi! link CocInfoVirtualText CocInfoSign
  hi! link CocHintVirtualText CocHintSign
endif

if g:rosepine_astro
  hi! link jsxTag Tag
  hi! link jsxTagName Tag
  hi! link astroJavaScriptExpression Tag
endif
unlet g:rosepine_transparency
unlet g:rosepine_polyglot
unlet g:rosepine_ale
unlet g:rosepine_coc
unlet g:rosepine_astro
