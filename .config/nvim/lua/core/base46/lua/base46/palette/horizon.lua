--- Credit And Reference: LunarVim/horizon.nvim
local shade = require('base46.color').shade

---@type base46
local horizon = {
  none = 'NONE',
  name = 'horizon',
  yellow = '#FAC29A',
  cyan = '#25B2BC',
  blue = '#75BEFF',
  darkblue = '#25B2BC',
  green = '#27D796',
  orange = '#F09383',
  violet = '#B877DB',
  magenta = '#ff007c',
  red = '#E95678',
  base_30 = {
    base00 = '#1D1F27', -- Default background
    base01 = '#1b1d24', -- Float background
    base02 = '#282b36', -- Statusline background
    base03 = '#4B4C53', -- WinSeparator, Border
    base04 = '#757c98', -- Statusline foreground
    base05 = '#D5D8DA', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#27D796', -- Diff Added
    base07 = '#25B2BC', -- Diff dified
    base08 = '#E95678', -- Diff Deleted
    base09 = '#FAC29A', -- Diagnostic Info, Hint
    base0A = '#FAB795', -- Diagnostic Warning
    base0B = '#21BFC2', -- Diagnostics Error
    base0C = '#25B2BC', -- rkup Bold
    base0D = '#B877DB', -- rkup Italic
    base0E = '#F43E5C', -- rkup URL
    base0F = '#F09383', -- rkup Inline Code
    base0G = '#FAC29A', -- rkup Heading 1
    base0H = '#FAB795', -- rkup Heading 2
    base0I = '#27D796', -- rkup Heading 3
    base0J = '#25B2BC', -- rkup Heading 4
    base0K = '#B877DB', -- rkup Heading 5
    base0L = '#F43E5C', -- rkup Heading 6
    base0M = '#E95678', -- Markup Tag
    base0N = '#21BFC2', -- rkup Tag Attribute
    base0O = '#F09383', -- rkup Tag Delimiter
    base0P = '#FAB795', -- Pmenu Background
    base0Q = '#B877DB', -- Folder Background
    base0R = '#E95678', -- Cursor Color
    base0S = '#FAB795', -- Accent, can be used as primary color
    base0T = '#FAC29A', -- Title
  },
  base_16 = {
    base00 = '#4B4C53', -- LineNr
    base01 = '#282b36', -- Lighter Background (folding marks)
    base02 = '#3a324a', -- Selection, Visual Background
    base03 = shade('#B877DB', 3), -- Comments, Invisibles, Line Highlighting
    base04 = '#E95678', -- Variable Parameter
    base05 = '#D5D8DA', -- Caret, Delimiters, Operators
    base06 = '#E95678', -- Property, Variable mber
    base07 = '#B877DB', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#E95678', -- Variables, X Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#F09383', -- Integers, Boolean, Constants, X Attributes, Markup Link Url
    base0A = '#FAC29A', -- Classes, rkup Bold, Search Text Background
    base0B = '#FAB795', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#B877DB', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#25B2BC', -- Functions, thods, Attribute IDs, Headings
    base0E = '#B877DB', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#B877DB', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
}

return horizon
