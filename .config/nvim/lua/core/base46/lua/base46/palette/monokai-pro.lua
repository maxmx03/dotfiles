--- Credit and Reference: loctvl842/monokai-pro.nvim

---@class base46
local monokai = {
  name = 'monokai-pro',
  none = 'NONE',
  yellow = '#ffd866',
  cyan = '#78dce8',
  blue = '#ab9df2', -- Use this for blue accent if needed
  darkblue = '#4a474a', -- Darker shade for dark blue
  green = '#a9dc76',
  orange = '#fc9867',
  violet = '#ab9df2',
  magenta = '#ab9df2', -- Adjust as necessary
  red = '#ff6188',
  base_30 = {
    base00 = '#2d2a2e', -- Default background
    base01 = '#19181a', -- Float background
    base02 = '#221f22', -- Statusline background
    base03 = '#939293', -- WinSeparator, Border
    base04 = '#a3a2a2', -- Statusline foreground
    base05 = '#c1c0bf', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#a9dc76', -- Diff Added
    base07 = '#fc9867', -- Diff Modified
    base08 = '#ff6188', -- Diff Deleted
    base09 = '#78dce8', -- Diagnostic Info, Hint
    base0A = '#fc9867', -- Diagnostic Warning
    base0B = '#ff6188', -- Diagnostics Error
    base0C = '#78dce8', -- rkup Bold
    base0D = '#ab9df2', -- rkup Italic
    base0E = '#ab9df2', -- rkup url
    base0F = '#fc9867', -- rkup Inline Code
    base0G = '#ff6188', -- rkup Heading 1
    base0H = '#fc9867', -- rkup Heading 2
    base0I = '#ffd866', -- rkup Heading 3
    base0J = '#a9dc76', -- rkup Heading 4
    base0K = '#78dce8', -- rkup Heading 5
    base0L = '#ab9df2', -- rkup Heading 6
    base0M = '#ff6188', -- Markup Tag
    base0N = '#78dce8', -- rkup Tag Attribute
    base0O = '#ff6188', -- rkup Tag Delimiter
    base0P = '#c1c0c0', -- Pmenu Background
    base0Q = '#ffd866', -- Folder Background
    base0R = '#c1c0c0', -- Cursor Color
    base0S = '#ff6188', -- Accent, can be used as primary color
    base0T = '#ff6188', -- Title
  },
  base_16 = {
    base00 = '#5b595c', -- LineNr
    base01 = '#4a474a', -- Lighter Background (folding marks)
    base02 = '#3a3939', -- Selection, Visual Background
    base03 = '#727072', -- Comments, Invisibles, Line Highlighting
    base04 = '#78dce8', -- Variable Parameter
    base05 = '#fcfcfa', -- Caret, Delimiters, Operators
    base06 = '#ab9df2', -- Property, Variable mber
    base07 = '#ff6188', -- PreProc, Include, Define, cro, PreCondit
    base08 = '#fcfcfa', -- Variables, X Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#ab9df2', -- Integers, Boolean, Constants, X Attributes, Markup Link Url
    base0A = '#78dce8', -- Classes, rkup Bold, Search Text Background
    base0B = '#ffd866', -- Strings, Inherited Class, rkup Code, Diff Inserted
    base0C = '#78dce8', -- Support, Regular Expressions, Escape Characters, rkup Quotes
    base0D = '#a9dc76', -- Functions, thods, Attribute IDs, Headings
    base0E = '#ff6188', -- Keywords, Storage, Selector, rkup Italic, Diff Changed
    base0F = '#ff6188', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
}

return monokai
