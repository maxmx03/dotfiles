--- Credit And Reference: folke/tokyonight.nvim

---@type base46
local tokyonight = {
  name = 'tokyonight',
  none = 'NONE',
  yellow = '#e0af68',
  cyan = '#7dcfff',
  blue = '#7aa2f7',
  darkblue = '#3d59a1',
  green = '#9ece6a',
  orange = '#ff9e64',
  violet = '#c099ff',
  magenta = '#ff007c',
  red = '#f7768e',
  base_30 = {
    base00 = '#1a1b26', -- Default background
    base01 = '#16161e', -- Float background
    base02 = '#16161e', -- Statusline background
    base03 = '#292e42', -- WinSeparator, Border
    base04 = '#a9b1d6', -- Statusline foreground
    base05 = '#c0caf5', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#449dab', -- Diff Added
    base07 = '#6183bb', -- Diff dified
    base08 = '#914c54', -- Diff Deleted
    base09 = '#0db9d7', -- Diagnostic Info, Hint
    base0A = '#e0af68', -- Diagnostic Warning
    base0B = '#db4b4b', -- Diagnostics Error
    base0C = '#ff9e64', -- rkup Bold
    base0D = '#ff9e64', -- rkup Italic
    base0E = '#ff9e64', -- rkup url
    base0F = '#ff9e64', -- rkup Inline Code
    base0G = '#7aa2f7', -- rkup Heading 1
    base0H = '#7aa2f7', -- rkup Heading 2
    base0I = '#2ac3de', -- rkup Heading 3
    base0J = '#2ac3de', -- rkup Heading 4
    base0K = '#73daca', -- rkup Heading 5
    base0L = '#73daca', -- rkup Heading 6
    base0M = '#b4f9f8', -- Markup Tag
    base0N = '#73daca', -- rkup Tag Attribute
    base0O = '#7dcfff', -- rkup Tag Delimiter
    base0P = '#7aa2f7', -- Pmenu Background
    base0Q = '#82aaff', -- Folder Color
    base0R = '#c0caf5', -- Cursor Color
    base0S = '#7aa2f7', -- Accent, can be used as primary color
    base0T = '#7aa2f7', -- Title
  },
  base_16 = {
    base00 = '#3b4261', -- LineNr
    base01 = '#0C0E14', -- Lighter Background (folding marks)
    base02 = '#283457', -- Selection, Visual Background
    base03 = '#565f89', -- Comments, Invisibles, Line Highlighting
    base04 = '#e0af68', -- Variable Parameter
    base05 = '#c0caf5', -- Caret, Delimiters, Operators
    base06 = '#73daca', -- Property, Variable mber
    base07 = '#7dcfff', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#c0caf5', -- Variables, X Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#ff9e64', -- Integers, Boolean, Constants, X Attributes, Markup Link Url
    base0A = '#2ac3de', -- Classes, rkup Bold, Search Text Background
    base0B = '#9ece6a', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#4fd6be', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#7aa2f7', -- Functions, thods, Attribute IDs, Headings
    base0E = '#c099ff', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#7aa2f7', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {
    ['@keyword.function'] = { fg = '#c099ff' },
  },
}

return tokyonight
