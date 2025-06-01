local color = require 'base46.color'
local lighten, shade = color.lighten, color.shade

---@type base46
local doomone = {
  none = 'NONE',
  name = 'doom-one',
  yellow = '#ecbe7b',
  cyan = '#46d9ff',
  blue = '#51afef',
  darkblue = '#2257a0',
  green = '#98be65',
  orange = '#da8548',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  red = '#ff6c6b',
  base_30 = {
    base00 = '#282c34', -- Default background
    base01 = '#1c1f24', -- Float background
    base02 = '#1c1f24', -- Statusline background
    base03 = '#3f444a', -- WinSeparator, Border
    base04 = '#bbc2cf', -- Statusline foreground
    base05 = '#bbc2cf', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#98be65', -- Diff Added
    base07 = '#da8548', -- Diff Modified
    base08 = '#ff6c6b', -- Diff Deleted
    base09 = '#46D9FF', -- Diagnostic Info, Hint
    base0A = '#ECBE7B', -- Diagnostic Warning
    base0B = '#ff6c6b', -- Diagnostics Error
    base0C = '#ECBE7B', -- Markup Bold
    base0D = '#51afef', -- Markup Italic
    base0E = '#51afef', -- Markup url
    base0F = '#ECBE7B', -- Markup Inline Code
    base0G = '#ff6c6b', -- Markup Heading 1
    base0H = '#ff6c6b', -- Markup Heading 2
    base0I = '#ECBE7B', -- Markup Heading 3
    base0J = '#ECBE7B', -- Markup Heading 4
    base0K = '#da8548', -- Markup Heading 5
    base0L = '#da8548', -- Markup Heading 6
    base0M = '#46D9FF', -- Markup Tag
    base0N = '#a9a1e1', -- Markup Tag Attribute
    base0O = '#46D9FF', -- Markup Tag Delimiter
    base0P = '#51afef', -- Pmenu Background
    base0Q = '#51afef', -- Folder Icon Color
    base0R = '#51afef', -- Cursor Color
    base0S = '#51afef', -- Accent, can be used as primary color
    base0T = '#a9a1e1', -- Title
  },
  base_16 = {
    base00 = '#3f444a', -- LineNr
    base01 = '#3f444a', -- Lighter Background (folding marks)
    base02 = '#2257A0', -- Selection, Visual Background
    base03 = shade('#a9a1e1', 3), -- Comments, Invisibles, Line Highlighting
    base04 = lighten('#c678dd', 40), -- Variable Parameter
    base05 = '#bbc2cf', -- Caret, Delimiters, Operators
    base06 = '#bbc2cf', -- Property, Variable Member
    base07 = '#a9a1e1', -- PreProc, Include, Define, Macro, PreCondit
    base08 = '#bbc2cf', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#da8548', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '#ECBE7B', -- Classes, Markup Bold, Search Text Background
    base0B = '#98be65', -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = '#a9a1e1', -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = '#c678dd', -- Functions, Methods, Attribute IDs, Headings
    base0E = '#51afef', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = '#a9a1e1', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {
    DashboardHeader = { fg = '#5b6268' },
    DashboardKey = { fg = '#a9a1e1' },
  },
}

return doomone
