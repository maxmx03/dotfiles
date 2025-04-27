--- Credit And Reference: LunarVim/horizon.nvim

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#FAC29A',
  cyan = '#25B2BC',
  blue = '#75BEFF',
  darkblue = '#25B2BC',
  green = '#27D796',
  orange = '#F09383',
  violet = '#B877DB',
  magenta = '#ff007c',
  red = '#E95678',
}

M.base_30 = {
  base00 = '#1D1F27', -- Default background
  base01 = '#1b1d24', -- Float background
  base02 = '#282b36', -- Statusline background
  base03 = '#4B4C53', -- WinSeparator, Border
  base04 = '#757c98', -- Statusline foreground
  base05 = '#D5D8DA', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#27D796', -- Diff Added
  base07 = '#25B2BC', -- Diff Modified
  base08 = '#E95678', -- Diff Deleted
  base09 = '#FAC29A', -- Diagnostic Info, Hint
  base0A = '#FAB795', -- Diagnostic Warning
  base0B = '#21BFC2', -- Diagnostics Error
  base0C = '#25B2BC', -- Markup Bold
  base0D = '#B877DB', -- Markup Italic
  base0E = '#F43E5C', -- Markup URL
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
  base0Q = '#E95678', -- Folder Background
  base0R = '#E95678', -- Cursor Color
  base0S = '#FAB795', -- Accent, can be used as primary color
  base0T = '#FAC29A', -- Title
}

M.base_16 = {
  base00 = '#4B4C53', -- LineNr
  base01 = '#282b36', -- Lighter Background (folding marks)
  base02 = '#3a324a', -- Selection, Visual Background
  base03 = '#4B4C53', -- Comments, Invisibles, Line Highlighting
  base04 = '#E95678', -- Variable Parameter
  base05 = '#D5D8DA', -- Caret, Delimiters, Operators
  base06 = '#E95678', -- Property, Variable Member
  base07 = '#B877DB', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#E95678', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#F09383', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#FAC29A', -- Classes, Markup Bold, Search Text Background
  base0B = '#FAB795', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#B877DB', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#25B2BC', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#B877DB', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#B877DB', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {}

return M
