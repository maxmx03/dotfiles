---@type base46
local solarized = {
  name = 'solarized',
  none = 'NONE',
  yellow = '#b58900',
  cyan = '#2aa198',
  blue = '#268bd3',
  darkblue = '#03394F',
  green = '#849900',
  orange = '#cb4b16',
  violet = '#6c71c4',
  magenta = '#d33682',
  red = '#dc322f',
  base_30 = {
    base00 = '#002b36', -- Default background
    base01 = '#002731', -- Float background
    base02 = '#002731', -- Statusline background
    base03 = '#586e75', -- WinSeparator, Border
    base04 = '#93a1a1', -- Statusline foreground
    base05 = '#839496', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#859900', -- Diff Added
    base07 = '#b58900', -- Diff Modified
    base08 = '#dc322f', -- Diff Deleted
    base09 = '#268bd3', -- Diagnostic Info, Hint
    base0A = '#cb4b16', -- Diagnostic Warning
    base0B = '#dc322f', -- Diagnostics Error
    base0C = '#cb4b16', -- Markup Bold
    base0D = '#cb4b16', -- Markup Italic
    base0E = '#6c71c4', -- Markup url
    base0F = '#cb4b16', -- Markup Inline Code
    base0G = '#dc322f', -- Markup Heading 1
    base0H = '#d33682', -- Markup Heading 2
    base0I = '#cb4b16', -- Markup Heading 3
    base0J = '#268bd3', -- Markup Heading 4
    base0K = '#859900', -- Markup Heading 5
    base0L = '#b58900', -- Markup Heading 6
    base0M = '#859900', -- Markup Tag
    base0N = '#268bd3', -- Markup Tag Attribute
    base0O = '#cb4b16', -- Markup Tag Delimiter
    base0P = '#2aa198', -- Pmenu Background
    base0Q = '#268bd3', -- Folder Background
    base0R = '#93a1a1', -- Cursor Color
    base0S = '#b58900', -- Accent, can be used as primary color
    base0T = '#dc322f', -- Title
  },
  base_16 = {
    base00 = '#586e75', -- LineNr
    base01 = '#073642', -- Lighter Background (folding marks)
    base02 = '#073642', -- Selection, Visual Background
    base03 = '#586e75', -- Comments, Invisibles, Line Highlighting
    base04 = '#cb4b16', -- Variable Parameter
    base05 = '#cb4b16', -- Caret, Delimiters, Operators
    base06 = '#839496', -- Property, Variable Member
    base07 = '#849900', -- PreProc, Include, Define, Macro, PreCondit
    base08 = '#839496', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#6c71c4', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '#b58900', -- Classes, Markup Bold, Search Text Background
    base0B = '#2aa198', -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = '#d33682', -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = '#268bd3', -- Functions, Methods, Attribute IDs, Headings
    base0E = '#849900', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = '#849900', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
}

return solarized
