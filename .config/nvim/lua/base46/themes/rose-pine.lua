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
  base00 = '#232136', -- Default background
  base01 = '#191724', -- Float background
  base02 = '#2a273f', -- Statusline background
  base03 = '#524f67', -- WinSeparator, Border
  base04 = '#e0def4', -- Statusline foreground
  base05 = '#e0def4', -- Default Foreground
  base06 = '#9ccfd8', -- Diff Added
  base07 = '#ea9a97', -- Diff Modified
  base08 = '#eb6f92', -- Diff Deleted
  base09 = '#9ccfd8', -- Diagnostic Info, Hint
  base0A = '#f6c177', -- Diagnostic Warning
  base0B = '#eb6f92', -- Diagnostics Error
  base0C = '#f6c177', -- Markup Bold
  base0D = '#3e8fb0', -- Markup Italic
  base0E = '#3e8fb0', -- Markup url
  base0F = '#f6c177', -- Markup Inline Code
  base0G = '#eb6f92', -- Markup Heading 1
  base0H = '#eb6f92', -- Markup Heading 2
  base0I = '#f6c177', -- Markup Heading 3
  base0J = '#f6c177', -- Markup Heading 4
  base0K = '#ea9a97', -- Markup Heading 5
  base0L = '#ea9a97', -- Markup Heading 6
  base0M = '#9ccfd8', -- Markup Tag
  base0N = '#c4a7e7', -- Markup Tag Attribute
  base0O = '#9ccfd8', -- Markup Tag Delimiter
  base0P = '#9ccfd8', -- Pmenu Background
  base0Q = '#9ccfd8', -- Folder Background
  base0R = '#9ccfd8', -- Cursor Color
  base0S = '#9ccfd8', -- Accent, can be used as primary color
  base0T = '#ebbcba', -- Title
}

M.base_16 = {
  base00 = '#6e6a86', -- LineNr
  base01 = '#2a283e', -- Lighter Background (folding marks)
  base02 = '#44415a', -- Selection, Visual Background
  base03 = '#908caa', -- Comments, Invisibles, Line Highlighting
  base04 = '#e0def4', -- Variable Parameter
  base05 = '#908caa', -- Caret, Delimiters, Operators
  base06 = '#e0def4', -- Property, Variable Member
  base07 = '#c4a7e7', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#e0def4', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#f6c177', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#f6c177', -- Classes, Markup Bold, Search Text Background
  base0B = '#3e8fb0', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#c4a7e7', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#9ccfd8', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#c4a7e7', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#c4a7e7', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  ['@function.method'] = { fg = M.accent.violet },
  ['@function.method.call'] = { link = '@function.method' },
  ['@lsp.type.method'] = { link = '@function.method' },
}

return M
