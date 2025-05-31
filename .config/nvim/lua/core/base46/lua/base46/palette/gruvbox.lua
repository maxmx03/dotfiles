---@type base46
local gruvbox = {
  name = 'gruvbox',
  none = 'NONE',
  yellow = '#fabd2f',
  cyan = '#8ec07c',
  blue = '#83a598',
  darkblue = '#83a598',
  green = '#b8bb26',
  orange = '#fe8019',
  violet = '#d3869b',
  magenta = '#d3869b',
  red = '#fb4934',
  base_30 = {
    base00 = '#282828', -- Default background
    base01 = '#1d2021', -- Float background
    base02 = '#1d2021', -- Statusline background
    base03 = '#504945', -- WinSeparator, Border
    base04 = '#ebdbb2', -- Statusline foreground
    base05 = '#ebdbb2', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#b8bb26', -- Diff Added
    base07 = '#8ec07c', -- Diff dified
    base08 = '#fb4934', -- Diff Deleted
    base09 = '#83a598', -- Diagnostic Info, Hint
    base0A = '#fe8019', -- Diagnostic Warning
    base0B = '#fb4934', -- Diagnostics Error
    base0C = '#fe8019', -- rkup Bold
    base0D = '#d3869b', -- rkup Italic
    base0E = '#bdae93', -- rkup url
    base0F = '#8ec07c', -- rkup Inline Code
    base0G = '#b8bb26', -- rkup Heading 1
    base0H = '#b8bb26', -- rkup Heading 2
    base0I = '#fabd2f', -- rkup Heading 3
    base0J = '#fabd2f', -- rkup Heading 4
    base0K = '#fe8019', -- rkup Heading 5
    base0L = '#fe8019', -- rkup Heading 6
    base0M = '#8ec07c', -- Markup Tag
    base0N = '#83a598', -- rkup Tag Attribute
    base0O = '#8ec07c', -- rkup Tag Delimiter
    base0P = '#83a598', -- Pmenu Background
    base0Q = '#b8bb26', -- Folder Background
    base0R = '#fe8019', -- Cursor Color
    base0S = '#fabd2f', -- Accent, can be used as primary color
    base0T = '#b8bb26', -- Title
  },
  base_16 = {
    base00 = '#7c6f64', -- LinrNr
    base01 = '#3c3836', -- Lighter Background (folding marks)
    base02 = '#504945', -- Selection, Visual Background
    base03 = '#665c54', -- Comments, Invisibles, Line Highlighting
    base04 = '#83a598', -- Variable Parameter
    base05 = '#ebdbb2', -- Caret, Delimiters, Operators
    base06 = '#83a598', -- Property, Variable mber
    base07 = '#fb4934', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#83a598', -- Variables, X Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#d3869b', -- Integers, Boolean, Constants, X Attributes, Markup Link Url
    base0A = '#fabd2f', -- Classes, rkup Bold, Search Text Background
    base0B = '#8ec07c', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#fe8019', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#b8bb26', -- Functions, thods, Attribute IDs, Headings
    base0E = '#fb4934', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#fb4934', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {},
}

gruvbox.groups = {
  LspInlayHint = { fg = gruvbox.base_16.base03 },
}

return gruvbox
