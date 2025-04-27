--- Credit and Reference: LunarVim/darkplus.nvim
local color = require 'lib.color'
local shade = color.shade

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#DCDCAA',
  cyan = '#4EC9B0',
  blue = '#4FC1FF',
  darkblue = '#264f78',
  green = '#6A9955',
  orange = '#CE9178',
  violet = '#c68aee',
  magenta = '#b77bdf',
  red = '#D16969',
}

M.base_30 = {
  base00 = '#1E1E1E', -- Default background
  base01 = '#181818', -- Float background
  base02 = '#181818', -- Statusline background
  base03 = '#2d2d2d', -- WinSeparator, Border
  base04 = '#dee1e6', -- Statusline foreground
  base05 = '#dee1e6', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#2da042', -- Diff Added
  base07 = '#0077d2', -- Diff Modified
  base08 = '#f85249', -- Diff Deleted
  base09 = '#4bc1fe', -- Diagnostic Info, Hint
  base0A = '#ff8800', -- Diagnostic Warning
  base0B = '#F44747', -- Diagnostics Error
  base0C = '#4FC1FF', -- Markup Bold
  base0D = '#4FC1FF', -- Markup Italic
  base0E = '#b77bdf', -- Markup URL
  base0F = '#6A9955', -- Markup Inline Code
  base0G = '#DCDCAA', -- Markup Heading 1
  base0H = '#ffcc77', -- Markup Heading 2
  base0I = '#ff8800', -- Markup Heading 3
  base0J = '#4FC1FF', -- Markup Heading 4
  base0K = '#0078d4', -- Markup Heading 5
  base0L = '#b77bdf', -- Markup Heading 6
  base0M = '#569cd6', -- Markup Tag
  base0N = '#9CDCFE', -- Markup Tag Attribute
  base0O = '#6e7681', -- Markup Tag Delimiter
  base0P = '#60a6e0', -- Pmenu Background
  base0Q = '#0078d4', -- Folder Background
  base0R = '#dee1e6', -- Cursor Color
  base0S = '#4FC1FF', -- Accent, can be used as primary color
  base0T = '#569cd6', -- Title
}

M.base_16 = {
  base00 = '#444444', -- LineNr
  base01 = '#181818', -- Lighter Background (folding marks)
  base02 = '#264f78', -- Selection, Visual Background
  base03 = '#6A9955', -- Comments, Invisibles, Line Highlighting
  base04 = '#9CDCFE', -- Variable Parameter
  base05 = '#dee1e6', -- Caret, Delimiters, Operators
  base06 = '#9CDCFE', -- Property, Variable Member
  base07 = '#c68aee', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#9CDCFE', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#4FC1FF', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#4EC9B0', -- Classes, Markup Bold, Search Text Background
  base0B = '#CE9178', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#569cd6', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#DCDCAA', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#569cd6', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#c68aee', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  LspInlayHint = { fg = shade(M.base_16.base0A, 5) },
  ['Operator'] = { link = 'Include' },
  ['@keyword.return'] = { link = 'Include' },
  ['@keyword.repeat'] = { link = 'Include' },
  ['@keyword.coroutine'] = { link = 'Include' },
  ['@keyword.conditional'] = { link = 'Include' },
}

return M
