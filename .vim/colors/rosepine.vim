vim9script

# rosepine modified Colorscheme for vim
# Url: maxmx03/dotfiles/.vim/colors/rosepine.vim
# Maintainer: Max Del Canto <github.com/maxmx03>
# License: MIT License

# if exists("g:loaded_rosepine")
#   finish
# endif

# g:loaded_rosepine = 1
set background=dark

hi clear

if exists('syntax_on')
  syntax reset
endif

set termguicolors
g:colors_name = 'rosepine'
g:rosepine_transparency = get(g:, 'rosepine_transparency', false)

if (has('termguicolors') && &termguicolors) || has('gui_running')
  g:terminal_ansi_colors = [
    "#26233A",
    "#EB6F92",
    "#95B1AC",
    "#F6C177",
    "#3B8BAB",
    "#EBBCBA",
    "#9CCFD8",
    "#E0DEF4",
    "#95B1AC",
    "#F6C177",
    "#9CCFD8",
    "#EBBCBA",
    "#9CCFD8",
    "#908CAA",
    "#908CAA",
    "#EB6F92",
    ]
endif



hi Conceal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi CursorColumn guifg=#1f1d2e guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#191724 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi WinSeparator guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi! link VertSplit WinSeparator
hi Folded guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi FoldColumn guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi IncSearch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
if g:rosepine_transparency
  hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
hi Conceal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#e0def4 gui=NONE cterm=NONE
hi CursorColumn guifg=#1f1d2e guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#191724 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi WinSeparator guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi FoldColumn guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi IncSearch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
if g:rosepine_transparency
  hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
hi NormalFloat guifg=#e0def4 guibg=#1f1d2e gui=NONE cterm=NONE
if g:rosepine_transparency
  hi NormalFloat guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
endif
hi FloatBorder guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi! link NormalNC Normal
hi! link Pmenu NormalFloat
hi PmenuSel guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#908caa gui=NONE cterm=NONE
hi Question guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi! link StatusLineNC StatusLine
hi TabLine guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
hi TabLineFill guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
hi TabLineSel guifg=#908caa guibg=#191724 gui=NONE cterm=NONE
hi Title guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi! link VisualNOS Visual
hi WildMenu guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi! link WinBar Normal
hi! link WinBarNC WinBar
hi Comment guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi String guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi! link Character String
hi Constant guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Boolan guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi Property guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Parameter guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi! link StorageClass Keyword
hi! link Structure Keyword
hi! link Typedef Keyword
hi Special guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi! link SpecialComment Keyword
hi! link Debug Keyword
hi Underlined guifg=#3B8BAB guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Added guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE

hi vimOption guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi! link vimUsrCmd Function
hi! link vimIsCommand Function
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link vim9Block Keyword
hi! link vimEnvvar Parameter

hi! link typescriptVariable Keyword
hi! link typescriptTypeReference Type
hi! link typescriptIdentifierName Function
hi! link typescriptObjectLiteral Property
hi! link typescriptObjectLabel Property

hi! link shVariable Constant
hi! link shDerefSimple Constant
hi! link shQuote String
hi! link shFunctionOne Function

hi! link htmlTag Tag
hi! link htmlTagN Tag
hi! link htmlEndTag Tag
hi! link htmlTagName Tag
hi! link htmlSpecialTagName Tag
hi htmlArg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE

unlet g:rosepine_transparency
