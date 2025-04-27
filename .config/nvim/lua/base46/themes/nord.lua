--- Credit and Reference: fcancelinha/nordern.nvim

---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '#EBCB8B',
  cyan = '#8FBCBB',
  blue = '#81A1C1',
  darkblue = '#7893B5',
  green = '#a3be8c',
  orange = '#D08770',
  violet = '#B48EAD',
  magenta = '#B48EAD',
  red = '#BF616A',
}

M.base_30 = {
  base00 = '#242933', -- Default background
  base01 = '#20242C', -- Float background
  base02 = '#20242C', -- Statusline background
  base03 = '#3B4252', -- WinSeparator, Border
  base04 = '#ECEFF4', -- Statusline foreground
  base05 = '#ECEFF4', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '#A3BE8C', -- Diff Added
  base07 = '#EBCB8B', -- Diff Modified
  base08 = '#BF616A', -- Diff Deleted
  base09 = '#A3BE8C', -- Diagnostic Info, Hint
  base0A = '#EBCB8B', -- Diagnostic Warning
  base0B = '#BF616A', -- Diagnostics Error
  base0C = '#88C0D0', -- Markup Bold
  base0D = '#88C0D0', -- Markup Italic
  base0E = '#88C0D0', -- Markup url
  base0F = '#88C0D0', -- Markup Inline Code
  base0G = '#88C0D0', -- Markup Heading 1
  base0H = '#BF616A', -- Markup Heading 2
  base0I = '#A3BE8C', -- Markup Heading 3
  base0J = '#B48EAD', -- Markup Heading 4
  base0K = '#81A1C1', -- Markup Heading 5
  base0L = '#EBCB8B', -- Markup Heading 6
  base0M = '#81A1C1', -- Markup Tag
  base0N = '#8FBCBB', -- Markup Tag Attribute
  base0O = '#81A1C1', -- Markup Tag Delimiter
  base0P = '#88C0D0', -- Pmenu Background
  base0Q = '#EBCB8B', -- Folder Background
  base0R = '#81A1C1', -- Cursor Color
  base0S = '#81A1C1', -- Accent, can be used as primary color
  base0T = '#EBCB8B', -- Title
}

M.base_16 = {
  base00 = '#475064', -- LineNr
  base01 = '#4C566A', -- Lighter Background (folding marks)
  base02 = '#353C4B', -- Selection, Visual Background
  base03 = '#475064', -- Comments, Invisibles, Line Highlighting
  base04 = '#7893B5', -- Variable Parameter
  base05 = '#88C0D0', -- Caret, Delimiters, Operators
  base06 = '#7893B5', -- Property, Variable Member
  base07 = '#88C0D0', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '#D8DEE9', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '#EBCB8B', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '#81A1C1', -- Classes, Markup Bold, Search Text Background
  base0B = '#A3BE8C', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '#88C0D0', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '#8FBCBB', -- Functions, Methods, Attribute IDs, Headings
  base0E = '#88C0D0', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '#616E88', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {
  Folded = { fg = '#88C0D0', bg = M.base_16.base00 },
}

return M
