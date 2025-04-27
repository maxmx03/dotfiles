--- Credits and Reference: neanias/everforest-nvim

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#dbbc7f',
  cyan = '#83c092',
  blue = '#7fbbb3',
  darkblue = '#7fbbb3',
  green = '#a7c080',
  orange = '#e69875',
  violet = '#d699b6',
  magenta = '#d699b6',
  red = '#e67e80',
}

M.base_30 = {
  base00 = '#272e33', -- Default background
  base01 = '#1e2326', -- Float background
  base02 = '#1e2326', -- Statusline background
  base03 = '#495156', -- WinSeparator, Border
  base04 = '#d3c6aa', -- Statusline foreground
  base05 = '#d3c6aa', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#a7c080', -- Diff Added
  base07 = '#dbbc7f', -- Diff Modified
  base08 = '#e67e80', -- Diff Deleted
  base09 = '#83c092', -- Diagnostic Info, Hint
  base0A = '#dbbc7f', -- Diagnostic Warning
  base0B = '#e67e80', -- Diagnostics Error
  base0C = '#e69875', -- Markup Bold
  base0D = '#e69875', -- Markup Italic
  base0E = '#d699b6', -- Markup url
  base0F = '#dbbc7f', -- Markup Inline Code
  base0G = '#83c092', -- Markup Heading 1
  base0H = '#83c092', -- Markup Heading 2
  base0I = '#7fbbb3', -- Markup Heading 3
  base0J = '#7fbbb3', -- Markup Heading 4
  base0K = '#a7c080', -- Markup Heading 5
  base0L = '#a7c080', -- Markup Heading 6
  base0M = '#e69875', -- Markup Tag
  base0N = '#a7c080', -- Markup Tag Attribute
  base0O = '#e69875', -- Markup Tag Delimiter
  base0P = '#a7c080', -- Pmenu Background
  base0Q = '#a7c080', -- Folder Background
  base0R = '#d3c6aa', -- Cursor Color
  base0S = '#a7c080', -- Accent, can be used as primary color
  base0T = '#a7c080', -- Title
}

M.base_16 = {
  base00 = '#7a8478', -- LineNr
  base01 = '#2e383c', -- Lighter Background (folding marks)
  base02 = '#4c3743', -- Selection, Visual Background
  base03 = '#859289', -- Comments, Invisibles, Line Highlighting
  base04 = '#e69875', -- Variable Parameter
  base05 = '#d3c6aa', -- Caret, Delimiters, Operators
  base06 = '#7fbbb3', -- Property, Variable Member
  base07 = '#e67e80', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#d3c6aa', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#d699b6', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#dbbc7f', -- Classes, Markup Bold, Search Text Background
  base0B = '#a7c080', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#d699b6', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#dbbc7f', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#e67e80', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#d699b6', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {}

return M
