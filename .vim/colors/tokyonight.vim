vim9script

# tokyonight Colorscheme for vim
# made with maxmx03/schemecraft
# Url: maxmx03/dotfiles
# Maintainer: Max Del Canto <github.com/maxmx03>
# License: MIT License

if exists("g:loaded_tokyonight")
  finish
endif

g:loaded_tokyonight = 1

hi clear

if exists('syntax_on')
  syntax reset
endif

set termguicolors
g:colors_name = 'tokyonight'
g:tokyonight_transparency = get(g:, 'tokyonight_transparency', false)

g:tokyonight_treesitter = get(g:, 'tokyonight_treesitter', false)
g:tokyonight_lspconfig = get(g:, 'tokyonight_lspconfig', false)
g:tokyonight_telescope = get(g:, 'tokyonight_telescope', false)
g:tokyonight_dashboard = get(g:, 'tokyonight_dashboard', false)
g:tokyonight_gitsigns = get(g:, 'tokyonight_gitsigns', false)
g:tokyonight_nvimtree = get(g:, 'tokyonight_nvimtree', false)
g:tokyonight_cmp = get(g:, 'tokyonight_cmp', false)
g:tokyonight_markview = get(g:, 'tokyonight_markview', false)

if (has('termguicolors') && &termguicolors) || has('gui_running')
  g:terminal_ansi_colors = [
    "#1A1B26",
    "#C0CAF5",
    "#9ECE6A",
    "#2AC3DE",
    "#7AA2F7",
    "#C099FF",
    "#4FD6BE",
    "#7DCFFF",
    "#C0CAF5",
    "#E0AF68",
    "#73DACA",
    "#7AA2F7",
    "#C099FF",
    "#4FD6BE",
    "#C0CAF5",
    "#565F89",
    ]
endif

hi Conceal guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi CursorColumn guifg=#16161e guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#283457 gui=NONE cterm=NONE
hi Directory guifg=#82aaff guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#449dab guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#6183bb guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#914c54 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#1a1b26 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#db4b4b guibg=NONE gui=NONE cterm=NONE
hi WinSeparator guifg=#292e42 guibg=NONE gui=NONE cterm=NONE
hi! link VertSplit WinSeparator
hi Folded guifg=#c0caf5 guibg=#0C0E14 gui=NONE cterm=NONE
hi FoldColumn guifg=#c0caf5 guibg=#0C0E14 gui=NONE cterm=NONE
hi IncSearch guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#565f89 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#c0caf5 guibg=#1a1b26 gui=NONE cterm=NONE
if g:tokyonight_transparency
  hi Normal guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#c0caf5 guibg=#1a1b26 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#16161e gui=NONE cterm=NONE
hi Conceal guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi CurSearch guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi lCursor guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=#c0caf5 gui=NONE cterm=NONE
hi CursorColumn guifg=#16161e guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#283457 gui=NONE cterm=NONE
hi Directory guifg=#82aaff guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#449dab guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#6183bb guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#914c54 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#1a1b26 guibg=NONE gui=NONE cterm=NONE
hi TermCursor guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi TermCursorNC guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#db4b4b guibg=NONE gui=NONE cterm=NONE
hi WinSeparator guifg=#292e42 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#c0caf5 guibg=#0C0E14 gui=NONE cterm=NONE
hi FoldColumn guifg=#c0caf5 guibg=#0C0E14 gui=NONE cterm=NONE
hi IncSearch guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Substitute guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi LineNrBelow guifg=#3b4261 guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi MatchParen guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi! link MsgArea Normal
hi NonText guifg=#565f89 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#c0caf5 guibg=#1a1b26 gui=NONE cterm=NONE
if g:tokyonight_transparency
  hi Normal guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
endif
hi SignColumn guifg=#c0caf5 guibg=#1a1b26 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#16161e gui=NONE cterm=NONE
hi NormalFloat guifg=#c0caf5 guibg=#16161e gui=NONE cterm=NONE
if g:tokyonight_transparency
  hi NormalFloat guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
endif
hi FloatBorder guifg=#292e42 guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi! link NormalNC Normal
hi! link Pmenu NormalFloat
hi PmenuSel guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#7aa2f7 gui=NONE cterm=NONE
hi Question guifg=#e0af68 guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#db4b4b guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#2ac3de guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#0db9d7 guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#e0af68 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#a9b1d6 guibg=#16161e gui=NONE cterm=NONE
hi! link StatusLineNC StatusLine
hi TabLine guifg=#565f89 guibg=#16161e gui=NONE cterm=NONE
hi TabLineFill guifg=#c0caf5 guibg=#16161e gui=NONE cterm=NONE
hi TabLineSel guifg=#c0caf5 guibg=#1a1b26 gui=NONE cterm=NONE
hi Title guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#283457 gui=NONE cterm=NONE
hi! link VisualNOS Visual
hi WildMenu guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi! link WinBar Normal
hi! link WinBarNC WinBar
hi Comment guifg=#565f89 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#9ece6a guibg=NONE gui=NONE cterm=NONE
hi! link Character String
hi Constant guifg=#ff9e64 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#ff9e64 guibg=NONE gui=NONE cterm=NONE
hi Boolan guifg=#ff9e64 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#ff9e64 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi Property guifg=#73daca guibg=NONE gui=NONE cterm=NONE
hi Parameter guifg=#e0af68 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#7dcfff guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#7dcfff guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#7dcfff guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#7dcfff guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#7dcfff guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#2ac3de guibg=NONE gui=NONE cterm=NONE
hi! link StorageClass Keyword
hi! link Structure Keyword
hi! link Typedef Keyword
hi Special guifg=#4fd6be guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#4fd6be guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#b4f9f8 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#c0caf5 guibg=NONE gui=NONE cterm=NONE
hi! link SpecialComment Keyword
hi! link Debug Keyword
hi Underlined guifg=#c099ff guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#db4b4b guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#7aa2f7 guibg=NONE gui=NONE cterm=NONE
hi Added guifg=#449dab guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#6183bb guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#914c54 guibg=NONE gui=NONE cterm=NONE

hi! link typescriptVariable Keyword
hi! link typescriptTypeReference Type

hi! link shVariable Constant
hi! link shDerefSimple Constant
hi! link shQuote String
hi! link shFunctionOne Function

hi! link vimVarScope Keyword
hi! link vimIsCommand Keyword

unlet g:tokyonight_transparency
unlet g:tokyonight_treesitter
unlet g:tokyonight_lspconfig
unlet g:tokyonight_telescope
unlet g:tokyonight_dashboard
unlet g:tokyonight_gitsigns
unlet g:tokyonight_nvimtree
unlet g:tokyonight_cmp
unlet g:tokyonight_markview
