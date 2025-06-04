--- Credit and Reference: LunarVim/darkplus.nvim
local color = require 'base46.color'
local shade = color.shade

---@type base46
local darkplus = {
  name = 'darkplus',
  none = 'NONE',
  yellow = '#DCDCAA',
  cyan = '#4EC9B0',
  blue = '#4FC1FF',
  darkblue = '#264f78',
  green = '#6A9955',
  orange = '#CE9178',
  violet = '#c68aee',
  magenta = '#b77bdf',
  red = '#D16969',
  base_30 = {
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
    base0C = '#4FC1FF', -- rkup Bold
    base0D = '#4FC1FF', -- rkup Italic
    base0E = '#b77bdf', -- rkup URL
    base0F = '#6A9955', -- rkup Inline Code
    base0G = '#DCDCAA', -- rkup Heading 1
    base0H = '#ffcc77', -- rkup Heading 2
    base0I = '#ff8800', -- rkup Heading 3
    base0J = '#4FC1FF', -- rkup Heading 4
    base0K = '#0078d4', -- rkup Heading 5
    base0L = '#b77bdf', -- rkup Heading 6
    base0M = '#569cd6', -- Markup Tag
    base0N = '#9CDCFE', -- rkup Tag Attribute
    base0O = '#6e7681', -- rkup Tag Delimiter
    base0P = '#60a6e0', -- Pmenu Background
    base0Q = '#0078d4', -- Folder Background
    base0R = '#dee1e6', -- Cursor Color
    base0S = '#4FC1FF', -- Accent, can be used as primary color
    base0T = '#569cd6', -- Title
  },
  base_16 = {
    base00 = '#444444', -- LineNr
    base01 = '#181818', -- Lighter Background (folding marks)
    base02 = '#264f78', -- Selection, Visual Background
    base03 = '#6A9955', -- Comments, Invisibles, Line Highlighting
    base04 = '#9CDCFE', -- Variable Parameter
    base05 = '#dee1e6', -- Caret, Delimiters, Operators
    base06 = '#9CDCFE', -- Property, Variable mber
    base07 = '#c68aee', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#9CDCFE', -- Variables, X Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#4FC1FF', -- Integers, Boolean, Constants, X Attributes, Markup Link Url
    base0A = '#4EC9B0', -- Classes, rkup Bold, Search Text Background
    base0B = '#CE9178', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#569cd6', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#DCDCAA', -- Functions, thods, Attribute IDs, Headings
    base0E = '#569cd6', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#c68aee', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {},
}

darkplus.groups = {
  LspInlayHint = { fg = shade(darkplus.base_16.base0A, 5) },
  ['Operator'] = { link = 'Include' },
  ['@keyword.return'] = { link = 'Include' },
  ['@keyword.repeat'] = { link = 'Include' },
  ['@keyword.coroutine'] = { link = 'Include' },
  ['@keyword.conditional'] = { link = 'Include' },
}

return darkplus
