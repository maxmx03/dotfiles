---@type base46
local M = {
  name = 'gruber-darker',
  none = 'NONE',
  yellow = '#ffdd33',
  cyan = '#95a99f',
  blue = '#96a6c8',
  darkblue = '#5f627f',
  green = '#73d936',
  orange = '#cc8c3c',
  violet = '#9e95c7',
  magenta = '#9e95c7',
  red = '#f43841',
  base_30 = {
    base00 = '#181818', -- Default background
    base01 = '#101010', -- Float background
    base02 = '#282828', -- Statusline background
    base03 = '#453d41', -- WinSeparator, Border
    base04 = '#f5f5f5', -- Statusline foreground
    base05 = '#e4e4e4', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '#73d936', -- Diff Added
    base07 = '#ffdd33', -- Diff Modified
    base08 = '#f43841', -- Diff Deleted
    base09 = '#96a6c8', -- Diagnostic Info, Hint
    base0A = '#ffdd33', -- Diagnostic Warning
    base0B = '#f43841', -- Diagnostics Error
    base0C = '#95a99f', -- Markup Bold
    base0D = '#9e95c7', -- Markup Italic
    base0E = '#96a6c8', -- Markup url
    base0F = '#cc8c3c', -- Markup Inline Code
    base0G = '#ffdd33', -- Markup Heading 1
    base0H = '#ffdd33', -- Markup Heading 2
    base0I = '#ffdd33', -- Markup Heading 3
    base0J = '#cc8c3c', -- Markup Heading 4
    base0K = '#cc8c3c', -- Markup Heading 5
    base0L = '#cc8c3c', -- Markup Heading 6
    base0M = '#9e95c7', -- Markup Tag
    base0N = '#95a99f', -- Markup Tag Attribute
    base0O = '#9e95c7', -- Markup Tag Delimiter
    base0P = '#ffdd33', -- Pmenu Background
    base0Q = '#96a6c8', -- Folder Background
    base0R = '#ffdd33', -- Cursor Color
    base0S = '#ffdd33', -- Accent, can be used as primary color
    base0T = '#cc8c3c', -- Title
  },
  base_16 = {
    base00 = '#52494e', -- LineNr
    base01 = '#282828', -- Lighter Background (folding marks)
    base02 = '#453d41', -- Selection, Visual Background
    base03 = '#52494e', -- Comments, Invisibles, Line Highlighting
    base04 = '#9e95c7', -- Variable Parameter
    base05 = '#e4e4e4', -- Caret, Delimiters, Operators
    base06 = '#f4f4ff', -- Property, Variable Member
    base07 = '#ffdd33', -- PreProc, Include, Define, Macro, PreCondit
    base08 = '#f4f4ff', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '#cc8c3c', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '#95a99f', -- Classes, Markup Bold, Search Text Background
    base0B = '#73c936', -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = '#ffdd33', -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = '#96a6c8', -- Functions, Methods, Attribute IDs, Headings
    base0E = '#ffdd33', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = '#ffdd33', -- Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
}

return M
