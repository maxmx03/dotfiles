--- Credit and Reference: github.com/EdenEast/nightfox.nvim

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#FAE3B0',
  cyan = '#3ddbd9',
  blue = '#82cfff',
  darkblue = '#78a9ff',
  green = '#42be65',
  orange = '#F8BD96',
  violet = '#d0a9e5',
  magenta = '#ff7eb6',
  red = '#ee5396',
}

M.base_30 = {
  base00 = '#161616', -- Default background
  base01 = '#0f0f0f', -- Float background
  base02 = '#202020', -- Statusline background
  base03 = '#383747', -- WinSeparator, Border
  base04 = '#dde1e6', -- Statusline foreground
  base05 = '#f2f4f8', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#08bdba', -- Diff Added
  base07 = '#78a9ff', -- Diff Modified
  base08 = '#ee5396', -- Diff Deleted
  base09 = '#78a9ff', -- Diagnostic Info, Hint
  base0A = '#be95ff', -- Diagnostic Warning
  base0B = '#ee5396', -- Diagnostics Error
  base0C = '#F8BD96', -- Markup Bold
  base0D = '#F8BD96', -- Markup Italic
  base0E = '#ff7eb6', -- Markup url
  base0F = '#78a9ff', -- Markup Inline Code
  base0G = '#ff7eb6', -- Markup Heading 1
  base0H = '#ee5396', -- Markup Heading 2
  base0I = '#FAE3B0', -- Markup Heading 3
  base0J = '#3ddbd9', -- Markup Heading 4
  base0K = '#d0a9e5', -- Markup Heading 5
  base0L = '#ee5396', -- Markup Heading 6
  base0M = '#3ddbd9', -- Markup Tag
  base0N = '#78a9ff', -- Markup Tag Attribute
  base0O = '#82cfff', -- Markup Tag Delimiter
  base0P = '#3ddbd9', -- Pmenu Background
  base0Q = '#ff7eb6', -- Folder Background
  base0R = '#ff7eb6', -- Cursor Color
  base0S = '#ff7eb6', -- Accent, can be used as primary color
  base0T = '#ee5396', -- Title
}

M.base_16 = {
  base00 = '#525252', -- LineNr
  base01 = '#262626', -- Lighter Background (folding marks)
  base02 = '#393939', -- Selection, Visual Background
  base03 = '#525252', -- Comments, Invisibles, Line Highlighting
  base04 = '#d0d0d0', -- Variable Parameter
  base05 = '#f2f4f8', -- Caret, Delimiters, Operators
  base06 = '#3ddbd9', -- Property, Variable Member
  base07 = '#be95ff', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#d0d0d0', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#78a9ff', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#ee5396', -- Classes, Markup Bold, Search Text Background
  base0B = '#33b1ff', -- Strings, Class, Markup Code, Diff Inserted
  base0C = '#ff7eb6', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#42be65', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#be95ff', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#be95ff', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {}

return M
