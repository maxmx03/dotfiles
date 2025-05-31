local shade = require('base46.color').shade

---@type base46
local dracula = {
  none = 'NONE',
  name = 'dracula',
  red = '#FF5555',
  orange = '#FFB86C',
  yellow = '#F1FA8C',
  green = '#50FA7B',
  violet = '#BD93F9',
  cyan = '#8BE9FD',
  blue = '#8BE9FD',
  magenta = '#FF79C6',
  darkblue = '#8BE9FD',
  base_30 = {
    base00 = '#282A36', -- Default background
    base01 = shade('#6272A4', 5), -- Float background
    base02 = shade('#6272A4', 5), -- Statusline background
    base03 = '#6272A4', -- WinSeparator, Border
    base04 = '#F8F8F2', -- Statusline foreground
    base05 = '#F8F8F2', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#50FA7B', -- Diff Added
    base07 = '#FFB86C', -- Diff Modified
    base08 = '#FF5555', -- Diff Deleted
    base09 = '#BD93F9', -- Diagnostic Info, Hint
    base0A = '#FFB86C', -- Diagnostic Warning
    base0B = '#FF5555', -- Diagnostics Error
    base0C = '#FFB86C', -- Markup Bold
    base0D = '#F1FA8C', -- Markup Italic
    base0E = '#8BE9FD', -- Markup url
    base0F = '#50FA7B', -- Markup Inline Code
    base0G = '#BD93F9', -- Markup Heading 1
    base0H = '#BD93F9', -- Markup Heading 2
    base0I = '#BD93F9', -- Markup Heading 3
    base0J = '#BD93F9', -- Markup Heading 4
    base0K = '#BD93F9', -- Markup Heading 5
    base0L = '#BD93F9', -- Markup Heading 6
    base0M = '#FF79C6', -- Markup Tag
    base0N = '#50FA7B', -- Markup Tag Attribute
    base0O = '#FF79C6', -- Markup Tag Delimiter
    base0P = '#8BE9FD', -- Pmenu Background
    base0Q = '#BD93F9', -- Folder Icon
    base0R = '#FF79C6', -- Cursor Color
    base0S = '#FF5555', -- Accent, can be used as primary color
    base0T = '#BD93F9', -- Title
  },
  base_16 = {
    base00 = '#6272A4', -- LineNr
    base01 = '#44475A', -- Lighter Background (folding marks)
    base02 = '#44475A', -- Selection, Visual Background
    base03 = '#6272A4', -- Comments, Invisibles, Line Highlighting
    base04 = '#FFB86C', -- Variable Parameter
    base05 = '#F8F8F2', -- Caret, Delimiters, Operators
    base06 = '#F8F8F2', -- Property, Variable Member
    base07 = '#FF79C6', -- PreProc, Include, Define, Macro, PreCondit
    base08 = '#F8F8F2', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#BD93F9', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '#8BE9FD', -- Classes, Markup Bold, Search Text Background
    base0B = '#F1FA8C', -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = '#FF79C6', -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = '#50FA7B', -- Functions, Methods, Attribute IDs, Headings
    base0E = '#FF79C6', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = '#BD93F9', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
}

return dracula
