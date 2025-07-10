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
  -- magenta = '#ff007c',
  magenta = '#F075B5',
  red = '#E95678',
  base_30 = {
    base00 = '#1D1F27', -- Default background
    base01 = '#1b1d24', -- Float background
    base02 = '#282b36', -- Statusline background
    base03 = '#4B4C53', -- WinSeparator, Border
    base04 = '#757c98', -- Statusline foreground
    base05 = '#D5D8DA', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#27D796', -- Diff Added
    base07 = '#21BFC2', -- Diff Modified
    base08 = '#E95379', -- Diff Deleted
    base09 = '#27D796', -- Diagnostic Info, Hint
    base0A = '#FAB28E', -- Diagnostic Warning
    base0B = '#F43E5C', -- Diagnostics Error
    base0C = '#B877DB', -- Markup Bold
    base0D = '#21BFC2', -- Markup Italic
    base0E = '#ff007c', -- Markup URL
    base0F = '#F09383', -- Markup Inline Code
    base0G = '#FAC29A', -- Markup Heading 1
    base0H = '#FAB795', -- Markup Heading 2
    base0I = '#27D796', -- Markup Heading 3
    base0J = '#25B2BC', -- Markup Heading 4
    base0K = '#B877DB', -- Markup Heading 5
    base0L = '#F43E5C', -- Markup Heading 6
    base0M = '#E95678', -- Markup Tag
    base0N = '#21BFC2', -- Markup Tag Attribute
    base0O = '#F09383', -- Markup Tag Delimiter
    base0P = '#FAB795', -- Pmenu Background
    base0Q = '#B877DB', -- Folder Background
    base0R = '#8E8F8D', -- Cursor Color
    base0S = '#FAB795', -- Accent, can be used as primary color
    base0T = '#FAC29A', -- Title
  },
  base_16 = {
    base00 = '#4B4C53', -- LineNr
    base01 = '#282b36', -- Lighter Background (folding marks)
    base02 = '#3a324a', -- Selection, Visual Background
    base03 = shade('#B877DB', 3), -- Comments, Invisibles, Line Highlighting
    base04 = '#F075B5', -- Variable Parameter
    base05 = '#D5D8DA', -- Caret, Delimiters, Operators
    base06 = '#E95678', -- Property, Variable member
    base07 = '#B877DB', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#E95678', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#F09383', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '#FAC29A', -- Classes, Markup Bold, Search Text Background
    base0B = '#FAB795', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#B877DB', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#25B2BC', -- Functions, Methods, Attribute IDs, Headings
    base0E = '#B877DB', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#B877DB', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {
    DashboardHeader = { fg = '#E95678' },
    DashboardKey = { fg = '#25B2BC' },
  },
}

return horizon
