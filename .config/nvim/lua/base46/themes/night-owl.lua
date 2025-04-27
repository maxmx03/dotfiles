--- Credit and Reference: oxfist/night-owl.nvim

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#b39554',
  cyan = '#7fdbca',
  blue = '#82aaff',
  darkblue = '#234d70',
  green = '#c5e478',
  orange = '#f78c6c',
  violet = '#a599e9',
  magenta = '#c792ea',
  red = '#ff5874',
}

M.base_30 = {
  base00 = '#021727', -- Default background
  base01 = '#010d18', -- Float background
  base02 = '#010d18', -- Statusline background
  base03 = '#262a39', -- WinSeparator, Border
  base04 = '#d6deeb', -- Statusline foreground
  base05 = '#d6deeb', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#9ccc65', -- Diff Added
  base07 = '#e2b93d', -- Diff Modified
  base08 = '#ef5350', -- Diff Deleted
  base09 = '#7fdbca', -- Diagnostic Info, Hint
  base0A = '#ecc48d', -- Diagnostic Warning
  base0B = '#ff869a', -- Diagnostics Error
  base0C = '#c5e478', -- Markup Bold
  base0D = '#c5e478', -- Markup Italic
  base0E = '#a599e9', -- Markup url
  base0F = '#80cbc4', -- Markup Inline Code
  base0G = '#c792ea', -- Markup Heading 1
  base0H = '#c789d6', -- Markup Heading 2
  base0I = '#d1aaff', -- Markup Heading 3
  base0J = '#ff2c83', -- Markup Heading 4
  base0K = '#e2a2f4', -- Markup Heading 5
  base0L = '#f6bbe5', -- Markup Heading 6
  base0M = '#caece6', -- Markup Tag
  base0N = '#c5e478', -- Markup Tag Attribute
  base0O = '#7fdbca', -- Markup Tag Delimiter
  base0P = '#82aaff', -- Pmenu Background
  base0Q = '#baebe2', -- Folder Background
  base0R = '#82aaff', -- Cursor Color
  base0S = '#c5e4fc', -- Accent, can be used as primary color
  base0T = '#82b1ff', -- Title
}

M.base_16 = {
  base00 = '#4b6479', -- Default Background
  base01 = '#092135', -- Lighter Background (folding marks)
  base02 = '#1d3b53', -- Selection, Visual Background
  base03 = '#637777', -- Comments, Invisibles, Line Highlighting
  base04 = '#d7dbe0', -- Variable Parameter
  base05 = '#d6deeb', -- Caret, Delimiters, Operators
  base06 = '#7fdbca', -- Property, Variable Member
  base07 = '#c792ea', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#78ccf0', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#f78c6c', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#ffcb8b', -- Classes, Markup Bold, Search Text Background
  base0B = '#ecc48d', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#ff2c83', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#82aaff', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#c792ea', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#7fdbca', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

return M
