-- Credit and Reference: https://github.com/mbadolato/iTerm2-Color-Schemes

---@class base46.colors
local M = {}

M.accent = {
  yellow = '#ffdd33',
  cyan = '#00afaf',
  blue = '#0087d7',
  darkblue = '#0087d7',
  green = '#00af5f',
  orange = '#d78700',
  violet = '#d787d7',
  magenta = '#ff00af',
  red = '#d7005f',
}

M.base_30 = {
  base00 = '#0d0d0d', -- Default background
  base01 = '#000000', -- Float background
  base02 = '#000000', -- Statusline background
  base03 = '#1c1c1c', -- WinSeparator, Border
  base04 = '#dadada', -- Statusline foreground
  base05 = '#dadada', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#00af00', -- Diff Added
  base07 = '#f7bf2b', -- Diff Modified
  base08 = '#ff6666', -- Diff Deleted
  base09 = '#dadada', -- Diagnostic Info, Hint
  base0A = '#ff00af', -- Diagnostic Warning
  base0B = '#ff005f', -- Diagnostics Error
  base0C = '#dadada', -- Markup Bold
  base0D = '#dadada', -- Markup Italic
  base0E = '#dadada', -- Markup url
  base0F = '#dadada', -- Markup Inline Code
  base0G = '#45eb45', -- Markup Heading 1
  base0H = '#45eb45', -- Markup Heading 2
  base0I = '#45eb45', -- Markup Heading 3
  base0J = '#45eb45', -- Markup Heading 4
  base0K = '#45eb45', -- Markup Heading 5
  base0L = '#45eb45', -- Markup Heading 6
  base0M = '#59ff59', -- Markup Tag
  base0N = '#e666ff', -- Markup Tag Attribute
  base0O = '#dadada', -- Markup Tag Delimiter
  base0P = '#a8a8a8', -- Pmenu Background
  base0Q = '#4c80ff', -- Folder Icon Color
  base0R = '#45eb45', -- Cursor Color
  base0S = '#45eb45', -- Accent, can be used as primary color
  base0T = '#45eb45', -- Title
}

M.base_16 = {
  base00 = '#585858', -- LineNr
  base01 = '#1c1c1c', -- Lighter Background (folding marks)
  base02 = '#0f1f0f', -- Selection, Visual Background
  base03 = '#707070', -- Comments, Invisibles, Line Highlighting
  base04 = '#dadada', -- Variable Parameter
  base05 = '#dadada', -- Caret, Delimiters, Operators
  base06 = '#dadada', -- Property, Variable Member
  base07 = '#40d9e6', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#dadada', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#ffd933', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#59ff59', -- Classes, Markup Bold, Search Text Background
  base0B = '#ffd933', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#dadada', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#4c80ff', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#e666ff', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#e666ff', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  ['@keyword.type'] = { fg = '#40d9e6' },
  ['@type.builtin'] = { fg = '#59ff59' },
  ['@lsp.type.operator'] = { fg = '#e666ff' },
  ['@character.printf'] = { fg = '#e666ff' },
  ['Operator'] = { fg = '#dadada' },
}

return M
