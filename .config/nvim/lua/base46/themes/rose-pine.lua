--- Credit and Reference: rosepinetheme.com

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#f6c177',
  cyan = '#9ccfd8',
  blue = '#9ccfd8',
  darkblue = '#3B8BAB',
  green = '#95b1ac',
  orange = '#ebbcba',
  violet = '#c4a7e7',
  magenta = '#ebbcba',
  red = '#eb6f92',
}

M.base_30 = {
  base00 = '#191724', -- Default background
  base01 = '#1f1d2e', -- Float background
  base02 = '#26233a', -- Statusline background
  base03 = '#6e6a86', -- WinSeparator, Border
  base04 = '#e0def4', -- Statusline foreground
  base05 = '#e0def4', -- Default Foreground
  base06 = '#9ccfd8', -- Diff Added
  base07 = '#ebbcba', -- Diff Modified
  base08 = '#eb6f92', -- Diff Deleted
  base09 = '#c4a7e7', -- Diagnostic Info, Hint
  base0A = '#f6c177', -- Diagnostic Warning
  base0B = '#eb6f92', -- Diagnostics Error
  base0C = '#f6c177', -- Markup Bold
  base0D = '#f6c177', -- Markup Italic
  base0E = '#c4a7e7', -- Markup url
  base0F = '#9ccfd8', -- Markup Inline Code
  base0G = '#c4a7e7', -- Markup Heading 1
  base0H = '#9ccfd8', -- Markup Heading 2
  base0I = '#ebbcba', -- Markup Heading 3
  base0J = '#f6c177', -- Markup Heading 4
  base0K = '#3B8BAB', -- Markup Heading 5
  base0L = '#95b1ac', -- Markup Heading 6
  base0M = '#9ccfd8', -- Markup Tag
  base0N = '#c4a7e7', -- Markup Tag Attribute
  base0O = '#908caa', -- Markup Tag Delimiter
  base0P = '#908caa', -- Pmenu Background
  base0Q = '#9ccfd8', -- Folder Background
  base0R = '#e0def4', -- Cursor Color
  base0S = '#e0def4', -- Accent, can be used as primary color
  base0T = '#ebbcba', -- Title
}

M.base_16 = {
  base00 = '#908caa', -- LineNr
  base01 = '#26233a', -- Lighter Background (folding marks)
  base02 = '#403d52', -- Selection, Visual Background
  base03 = '#908caa', -- Comments, Invisibles, Line Highlighting
  base04 = '#c4a7e7', -- Variable Parameter
  base05 = '#908caa', -- Caret, Delimiters, Operators
  base06 = '#9ccfd8', -- Property, Variable Member
  base07 = '#3B8BAB', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#e0def4', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#f6c177', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#9ccfd8', -- Classes, Markup Bold, Search Text Background
  base0B = '#f6c177', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#c4a7e7', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#ebbcba', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#3B8BAB', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#c4a7e7', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  ['@function.method'] = { fg = M.accent.violet },
  ['@function.method.call'] = { link = '@function.method' },
  ['@lsp.type.method'] = { link = '@function.method' },
}

return M
