# Base46

- [contrast-checker](https://webaim.org/resources/contrastchecker/)
- [coolors](https://coolors.co)
- [colorhex](https://www.colorhexa.com)
- [256-colors-cheet](https://www.ditig.com/publications/256-colors-cheat-sheet)

```lua
---@class base46.colors
local M = {}

M.none = 'NONE'

M.accent = {
  yellow = '',
  cyan = '',
  blue = '',
  darkblue = '',
  green = '',
  orange = '',
  violet = '',
  magenta = '',
  red = '',
}

M.base_30 = {
  base00 = '', -- Default background
  base01 = '', -- Float background
  base02 = '', -- Statusline background
  base03 = '', -- WinSeparator, Border
  base04 = '', -- Statusline foreground
  base05 = '', -- Default Foreground, Caret, Delimiters, Operators
  base06 = '', -- Diff Added
  base07 = '', -- Diff Modified
  base08 = '', -- Diff Deleted
  base09 = '', -- Diagnostic Info, Hint
  base0A = '', -- Diagnostic Warning
  base0B = '', -- Diagnostics Error
  base0C = '', -- Markup Bold
  base0D = '', -- Markup Italic
  base0E = '', -- Markup url
  base0F = '', -- Markup Inline Code
  base0G = '', -- Markup Heading 1
  base0H = '', -- Markup Heading 2
  base0I = '', -- Markup Heading 3
  base0J = '', -- Markup Heading 4
  base0K = '', -- Markup Heading 5
  base0L = '', -- Markup Heading 6
  base0M = '', -- Markup Tag
  base0N = '', -- Markup Tag Attribute
  base0O = '', -- Markup Tag Delimiter
  base0P = '', -- Pmenu Background
  base0Q = '', -- Folder Background
  base0R = '', -- Cursor Color
  base0S = '', -- Accent, can be used as primary color
  base0T = '', -- Title
}

M.base_16 = {
  base00 = '', -- LineNr
  base01 = '', -- Lighter Background (folding marks)
  base02 = '', -- Selection, Visual Background
  base03 = '', -- Comments, Invisibles, Line Highlighting
  base04 = '', -- Variable Parameter
  base05 = '', -- Caret, Delimiters, Operators
  base06 = '', -- Property, Variable Member
  base07 = '', -- PreProc, Include, Define, Macro, PreCondit
  base08 = '', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = '', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = '', -- Classes, Markup Bold, Search Text Background
  base0B = '', -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = '', -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = '', -- Functions, Methods, Attribute IDs, Headings
  base0E = '', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = '', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.groups = {}

return M
```

## Credits

- [nvchad](https://github.com/NvChad/base46)
- [base16](https://github.com/chriskempson/base16)
