--- Credit And Reference: LunarVim/synthwave84.nvim

local color = require 'lib.color'
local blend = color.blend

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#f9f871',
  cyan = '#8df7e3',
  blue = '#66d9ef',
  darkblue = '#005f87',
  green = '#72f1b8',
  orange = '#ff8b39',
  violet = '#b45aff',
  magenta = '#ff2c70',
  red = '#ff5555',
}

M.base_30 = {
  base00 = '#262335', -- Default background
  base01 = '#241B2F', -- Float background
  base02 = '#1f1d2e', -- Statusline background
  base03 = '#4a4458', -- WinSeparator, Border
  base04 = '#6f6f8b', -- Statusline foreground
  base05 = '#e0def4', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#587c0c', -- Diff Added
  base07 = '#0c7d9d', -- Diff Modified
  base08 = '#94151b', -- Diff Deleted
  base09 = '#1cbc9b', -- Diagnostic Info, Hint
  base0A = '#eeaf58', -- Diagnostic Warning
  base0B = '#db4b4b', -- Diagnostics Error
  base0C = '#ff8b39', -- Markup Bold
  base0D = '#ff2c70', -- Markup Italic
  base0E = '#66d9ef', -- Markup url
  base0F = '#b45aff', -- Markup Inline Code
  base0G = '#ff8b39', -- Markup Heading 1
  base0H = '#f9f871', -- Markup Heading 2
  base0I = '#ff2c70', -- Markup Heading 3
  base0J = '#b45aff', -- Markup Heading 4
  base0K = '#ff8b39', -- Markup Heading 5
  base0L = '#8df7e3', -- Markup Heading 6
  base0M = '#72f1b8', -- Markup Tag
  base0N = '#ffcc00', -- Markup Tag Attribute
  base0O = '#66d9ef', -- Markup Tag Delimiter
  base0P = '#E8AB53', -- Pmenu Background
  base0Q = '#42A5F5', -- Folder Background
  base0R = '#ff5555', -- Cursor Color
  base0S = '#66d9ef', -- Accent, can be used as primary color
  base0T = '#f9f871', -- Title
}

M.base_16 = {
  base00 = '#848bbd', -- LineNr
  base01 = '#241B2F', -- Lighter Background (folding marks)
  base02 = '#264F78', -- Selection, Visual Background
  base03 = '#4a4458', -- Comments, Invisibles, Line Highlighting
  base04 = '#ff7edb', -- Variable Parameter
  base05 = '#ffffff', -- Caret, Delimiters, Operators
  base06 = '#ff7edb', -- Property, Variable Member
  base07 = '#72f1b8', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#ff7edb', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#ff7edb', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#ff5555', -- Classes, Markup Bold, Search Text Background
  base0B = '#ff8b39', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#ffefae', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#66d9ef', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#ffefae', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#ff7edb', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

local alpha = 0.05
local background = M.base_30.base00
M.groups = {
  Type = { fg = '#ff5555', bg = '#342532', bold = true },
  Function = { fg = '#66d9ef', bg = '#262d3f', bold = true },
  Keyword = { fg = '#ffefae', bg = '#312c37', bold = true },
  Statement = { link = 'Keyword' },
  Operator = { fg = '#fede5d', bg = '#312c37', bold = true },
  CursorLineNr = { link = 'Operator' },
  ['@tag'] = { fg = '#72f1b8', bg = blend('#72f1b8', background, alpha), bold = true },
  ['@tag.attribute'] = { fg = '#ffcc00', bg = blend('#ffcc00', background, alpha), bold = true },
  ['@tag.delimiter'] = { fg = '#66d9ef', bg = blend('#66d9ef', background, alpha), bold = true },
  ['@constant.html'] = { link = '@tag' },
  ['@keyword.function'] = { fg = '#72f1b8' },
  ['LspInlayHint'] = { link = 'Comment' },
}

return M
