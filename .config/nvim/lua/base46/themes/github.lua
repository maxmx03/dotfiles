---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#e5c07b',
  cyan = '#a5d6ff',
  blue = '#61afef',
  darkblue = '#56b6c2',
  green = '#8ddb8c',
  orange = '#d19a66',
  violet = '#d2a8ff',
  magenta = '#dcbdfb',
  red = '#e06c75',
}

M.base_30 = {
  base00 = '#0d1117', -- Default background
  base01 = '#090C10', -- Float background
  base02 = '#090C10', -- Statusline background
  base03 = '#3b4756', -- WinSeparator, Border
  base04 = '#4c5156', -- Statusline foreground
  base05 = '#d1d7e0', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#8ddb8c', -- Diff Added
  base07 = '#d19a66', -- Diff Modified
  base08 = '#e06c75', -- Diff Deleted
  base09 = '#a5d6ff', -- Diagnostic Info, Hint
  base0A = '#e5c07b', -- Diagnostic Warning
  base0B = '#e06c75', -- Diagnostics Error
  base0C = '#a5d6ff', -- Markup Bold
  base0D = '#d2a8ff', -- Markup Italic
  base0E = '#dcbdfb', -- Markup URL
  base0F = '#d19a66', -- Markup Inline Code
  base0G = '#e5c07b', -- Markup Heading 1
  base0H = '#eac55f', -- Markup Heading 2
  base0I = '#8ddb8c', -- Markup Heading 3
  base0J = '#61afef', -- Markup Heading 4
  base0K = '#d2a8ff', -- Markup Heading 5
  base0L = '#dcbdfb', -- Markup Heading 6
  base0M = '#8ddb8c', -- Markup Tag
  base0N = '#61afef', -- Markup Tag Attribute
  base0O = '#d1d7e0', -- Markup Tag Delimiter
  base0P = '#61afef', -- Pmenu Background
  base0Q = '#79c0ff', -- Folder Background
  base0R = '#d1d7e0', -- Cursor Color
  base0S = '#61afef', -- Accent, can be used as primary color
  base0T = '#e5c07b', -- Title
}

M.base_16 = {
  base00 = '#4d5359', -- LineNr
  base01 = '#262c36', -- Lighter Background (folding marks)
  base02 = '#343642', -- Selection, Visual Background
  base03 = '#4d5359', -- Comments, Invisibles, Line Highlighting
  base04 = '#d1d7e0', -- Variable Parameter
  base05 = '#d1d7e0', -- Caret, Delimiters, Operators
  base06 = '#d2a8ff', -- Property, Variable Member
  base07 = '#e06c75', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#d1d7e0', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#d19a66', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#e5c07b', -- Classes, Markup Bold, Search Text Background
  base0B = '#a5d6ff', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#e06c75', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#61afef', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#e06c75', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#d2a8ff', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  Visual = { bg = '#5b5170' },
  ['@operator.html'] = { fg = M.base_16.base05 },
  CursorLineNr = { fg = M.base_16.base05 },
}

return M
