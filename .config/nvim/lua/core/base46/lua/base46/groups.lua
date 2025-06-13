---@class base30
---@field base00 string
---@field base01 string
---@field base02 string
---@field base03 string
---@field base04 string
---@field base05 string
---@field base06 string
---@field base07 string
---@field base08 string
---@field base09 string
---@field base0A string
---@field base0B string
---@field base0C string
---@field base0D string
---@field base0E string
---@field base0F string
---@field base0G string
---@field base0H string
---@field base0I string
---@field base0J string
---@field base0K string
---@field base0L string
---@field base0M string
---@field base0N string
---@field base0O string
---@field base0P string
---@field base0Q string
---@field base0R string
---@field base0S string
---@field base0T string

---@class base16
---@field base00 string
---@field base01 string
---@field base02 string
---@field base03 string
---@field base04 string
---@field base05 string
---@field base06 string
---@field base07 string
---@field base08 string
---@field base09 string
---@field base0A string
---@field base0B string
---@field base0C string
---@field base0D string
---@field base0E string
---@field base0F string

---@class base46
---@field none "NONE"
---@field yellow string
---@field cyan string
---@field blue string
---@field darkblue string
---@field green string
---@field orange string
---@field violet string
---@field magenta string
---@field red string
---@field base_30 base30
---@field base_16 base16
---@field groups? table
---@field name string

local M = {}

---@param base46 base46
---@param config base46.config
function M.load_faces(base46, config)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.g.colors_name = base46.name
  local hl = vim.api.nvim_set_hl
  local color = require 'base46.color'
  local shade = color.shade
  local blend = color.blend

  local term = {
    'base01',
    'base08',
    'base0B',
    'base0A',
    'base0D',
    'base0E',
    'base0C',
    'base05',
    'base03',
    'base08',
    'base0B',
    'base0A',
    'base0D',
    'base0E',
    'base0C',
    'base07',
  }
  for index, key in ipairs(term) do
    vim.g['terminal_color_' .. index - 1] = base46.base_16[key]
  end

  hl(0, 'Comment', { fg = base46.base_16.base03 })
  hl(0, 'String', { fg = base46.base_16.base0B })
  hl(0, 'Character', { link = 'String' })
  hl(0, 'Constant', { fg = base46.base_16.base09 })
  hl(0, 'Number', { fg = base46.base_16.base09 })
  hl(0, 'Boolan', { fg = base46.base_16.base09 })
  hl(0, 'Float', { fg = base46.base_16.base09 })
  hl(0, 'Identifier', { fg = base46.base_16.base08 })
  hl(0, 'Property', { fg = base46.base_16.base06 })
  hl(0, 'Parameter', { fg = base46.base_16.base04 })
  hl(0, 'Function', { fg = base46.base_16.base0D })

  hl(0, 'Statement', { fg = base46.base_16.base0E })
  hl(0, 'Conditional', { fg = base46.base_16.base0E })
  hl(0, 'Repeat', { fg = base46.base_16.base0E })
  hl(0, 'Label', { fg = base46.base_16.base0E })
  hl(0, 'Operator', { fg = base46.base_16.base0E })
  hl(0, 'Keyword', { fg = base46.base_16.base0E })
  hl(0, 'Exception', { fg = base46.base_16.base0E })

  hl(0, 'PreProc', { fg = base46.base_16.base07 })
  hl(0, 'Include', { fg = base46.base_16.base07 })
  hl(0, 'Define', { fg = base46.base_16.base07 })
  hl(0, 'Macro', { fg = base46.base_16.base07 })
  hl(0, 'PreCondit', { fg = base46.base_16.base07 })

  hl(0, 'Type', { fg = base46.base_16.base0A })
  hl(0, 'StorageClass', { link = 'Keyword' })
  hl(0, 'Structure', { link = 'Keyword' })
  hl(0, 'Typedef', { link = 'Keyword' })

  hl(0, 'Special', { fg = base46.base_16.base0C })
  hl(0, 'SpecialChar', { fg = base46.base_16.base0C })
  hl(0, 'Tag', { fg = base46.base_30.base0M })
  hl(0, 'Delimiter', { fg = base46.base_16.base05 })
  hl(0, 'SpecialComment', { link = 'Keyword' })
  hl(0, 'Debug', { link = 'Keyword' })
  hl(0, 'Underlined', { fg = base46.base_16.base0E, underline = true })

  hl(0, 'Error', { fg = base46.base_30.base0B })
  hl(0, 'Todo', { fg = base46.base_30.base0T })
  hl(0, 'Added', { fg = base46.base_30.base06 })
  hl(0, 'Changed', { fg = base46.base_30.base07 })
  hl(0, 'Removed', { fg = base46.base_30.base08 })

  hl(0, 'Conceal', { fg = base46.base_30.base0S })
  hl(0, 'CurSearch', { fg = base46.base_30.base0S })
  hl(0, 'Cursor', { bg = base46.base_30.base0R })
  hl(0, 'lCursor', { bg = base46.base_30.base0R })
  hl(0, 'CursorIM', { bg = base46.base_30.base0R })
  hl(0, 'CursorColumn', { link = 'ColorColumn' })
  hl(0, 'CursorLine', { bg = base46.base_16.base02 })
  hl(0, 'Directory', { fg = base46.base_30.base0Q, bold = true })
  hl(
    0,
    'DiffAdd',
    { fg = base46.base_30.base06, bg = blend(base46.base_30.base06, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'DiffChange',
    { fg = base46.base_30.base07, bg = blend(base46.base_30.base07, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'DiffDelete',
    { fg = base46.base_30.base08, bg = blend(base46.base_30.base08, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'DiffText',
    { fg = base46.base_30.base09, bg = blend(base46.base_30.base09, base46.base_30.base00, 0.15) }
  )
  hl(0, 'EndOfBuffer', { fg = base46.base_30.base00 })
  hl(0, 'TermCursor', { fg = base46.base_30.base0R, reverse = true })
  hl(0, 'TermCursorNC', { fg = base46.base_30.base0R })
  hl(0, 'ErrorMsg', { fg = base46.base_30.base0B })
  hl(0, 'WinSeparator', { fg = base46.base_30.base03 })
  hl(0, 'Folded', { fg = base46.base_30.base05, bg = base46.base_16.base01 })
  hl(0, 'FoldColumn', { fg = base46.base_30.base05, bg = base46.base_16.base01 })
  hl(0, 'IncSearch', { fg = base46.base_30.base0S, reverse = true })
  hl(0, 'Substitute', { fg = base46.base_30.base0S })
  hl(0, 'LineNr', { fg = base46.base_16.base00 })
  hl(0, 'LineNrAbove', { fg = base46.base_16.base00 })
  hl(0, 'LineNrBelow', { fg = base46.base_16.base00 })
  hl(0, 'CursorLineNr', { fg = base46.base_30.base0S })
  hl(0, 'CursorLineFold', { link = 'Folded' })
  hl(0, 'CursorLineSign', { link = 'SignColumn' })
  hl(0, 'MatchParen', { fg = base46.base_30.base0S })
  hl(0, 'ModeMsg', { fg = base46.base_30.base09 })
  hl(0, 'MsgArea', { link = 'Normal' })
  hl(0, 'NonText', { fg = base46.base_16.base03 })

  if config.transparency == 1 then
    hl(0, 'Normal', { fg = base46.base_30.base05, bg = base46.none })
    hl(0, 'SignColumn', { fg = base46.base_30.base05 })
    hl(0, 'ColorColumn', { bg = base46.base_30.base00 })
    local background = shade(base46.base_16.base01, 2)
    hl(0, 'BufferLineFill', { bg = background })
    hl(0, 'BufferLineBufferSelected', { fg = base46.base_30.base05 })
    hl(0, 'BufferLineSeparator', { fg = background })
    hl(0, 'BufferLineSeparatorSelected', { fg = background })
    hl(0, 'BufferLineSeparatorVisible', { fg = background })
  else
    hl(0, 'Normal', { fg = base46.base_30.base05, bg = base46.base_30.base00 })
    hl(0, 'SignColumn', { fg = base46.base_30.base05, bg = base46.base_30.base00 })
    hl(0, 'ColorColumn', { bg = base46.base_30.base01 })
  end

  hl(0, 'NormalFloat', { fg = base46.base_30.base05, bg = base46.base_30.base01 })
  hl(0, 'FloatBorder', { fg = base46.base_30.base03 })
  hl(0, 'FloatTitle', { fg = base46.base_30.base0T })
  hl(0, 'NormalNC', { link = 'Normal' })
  hl(0, 'Pmenu', { link = 'NormalFloat' })
  hl(0, 'PmenuSel', { fg = base46.base_30.base0P, reverse = true })
  hl(0, 'PmenuSbar', { fg = base46.base_30.base0P })
  hl(0, 'PmenuThumb', { bg = base46.base_30.base0P })
  hl(0, 'Question', { fg = base46.base_30.base0A })
  hl(0, 'QuickFixLine', { fg = base46.base_30.base0B })
  hl(0, 'Search', { fg = base46.base_16.base0A })
  hl(0, 'SpellBad', { strikethrough = true })
  hl(0, 'SpellCap', { fg = base46.base_30.base09, underline = true })
  hl(0, 'SpellLocal', { fg = base46.base_30.base09, underline = true })
  hl(0, 'SpellRare', { fg = base46.base_30.base0A, underline = true })
  hl(0, 'StatusLine', { fg = base46.base_30.base04, bg = base46.base_30.base02 })
  hl(0, 'StatusLineNC', { link = 'StatusLine' })
  hl(0, 'TabLine', { fg = base46.base_16.base03, bg = base46.base_30.base01 })
  hl(0, 'TabLineFill', { fg = base46.base_16.base05, bg = base46.base_30.base01 })
  hl(0, 'TabLineSel', { fg = base46.base_16.base05, bg = base46.base_30.base00 })
  hl(0, 'Title', { fg = base46.base_30.base0T })
  hl(0, 'Visual', { bg = base46.base_16.base02 })
  hl(0, 'VisualNOS', { link = 'Visual' })
  hl(0, 'WildMenu', { fg = base46.base_30.base0P, reverse = true })
  hl(0, 'WinBar', { link = 'Normal' })
  hl(0, 'WinBarNC', { link = 'WinBar' })

  hl(0, 'NvimTreeFolderName', { fg = base46.base_30.base0Q })
  hl(0, 'NvimTreeFolderIcon', { fg = base46.base_30.base0Q })

  hl(0, '@variable', { link = 'Identifier' })
  hl(0, '@variable.builtin', { link = 'Constant' })
  hl(0, '@variable.parameter', { link = 'Parameter' })
  hl(0, '@variable.member', { link = 'Property' })
  hl(0, '@property', { link = 'Property' })
  hl(0, '@property.json', { link = 'Keyword' })
  hl(0, '@property.yaml', { link = 'Keyword' })
  hl(0, '@constant', { link = 'Constant' })
  hl(0, '@constant.builtin', { link = 'Constant' })
  hl(0, '@constant.macro', { link = 'Constant' })
  hl(0, '@constant.html', { link = 'Tag' })
  hl(0, '@module', { link = 'Type' })
  hl(0, '@module.builtin', { link = 'Constant' })
  hl(0, '@label', { link = 'Statement' })
  hl(0, '@string', { link = 'String' })
  hl(0, '@string.documentation', { link = 'Statement' })
  hl(0, '@string.regexp', { link = 'Special' })
  hl(0, '@string.escape', { link = 'Statement' })
  hl(0, '@string.special', { link = 'Special' })
  hl(0, '@string.special.symbol', { link = 'Identifier' })
  hl(0, '@string.special.url', { link = 'Underlined' })
  hl(0, '@character', { link = 'Constant' })
  hl(0, '@character.special', { link = 'Constant' })
  hl(0, '@character.printf', { link = 'Keyword' })
  hl(0, '@type', { link = 'Type' })
  hl(0, '@type.builtin', { link = 'Keyword' })
  hl(0, '@type.definition', { link = 'Type' })
  hl(0, '@type.qualifier', { link = 'Type' })
  hl(0, '@attribute', { link = 'Keyword' })
  hl(0, '@function', { link = 'Function' })
  hl(0, '@function.builtin', { link = 'Function' })
  hl(0, '@function.call', { link = 'Function' })
  hl(0, '@function.macro', { link = 'Function' })
  hl(0, '@function.method', { link = 'Function' })
  hl(0, '@function.method.call', { link = 'Function' })
  hl(0, '@constructor', { link = 'Type' })
  hl(0, '@constructor.lua', { link = 'Delimiter' })
  hl(0, '@operator', { link = 'Operator' })
  hl(0, '@keyword', { link = 'Keyword' })
  hl(0, '@keyword.coroutine', { link = 'Statement' })
  hl(0, '@keyword.function', { link = 'Keyword' })
  hl(0, '@keyword.type', { link = 'Keyword' })
  hl(0, '@keyword.operator', { link = 'Statement' })
  hl(0, '@keyword.import', { link = 'Include' })
  hl(0, '@keyword.repeat', { link = 'Statement' })
  hl(0, '@keyword.return', { link = 'Statement' })
  hl(0, '@keyword.debug', { link = 'Keyword' })
  hl(0, '@keyword.exception', { link = 'Statement' })
  hl(0, '@keyword.conditional', { link = 'Statement' })
  hl(0, '@keyword.conditional.ternary', { link = 'Statement' })
  hl(0, '@keyword.directive', { link = 'Statement' })
  hl(0, '@keyword.directive.define', { link = 'Statement' })
  hl(0, '@punctuation.delimiter', { link = 'Delimiter' })
  hl(0, '@punctuation.bracket', { link = 'Delimiter' })
  hl(0, '@punctuation.bracket.php', { fg = base46.base_16.base0F })
  hl(0, '@punctuation.special', { link = 'Keyword' })
  hl(0, '@comment', { link = 'Comment' })
  hl(0, '@comment.documentation', { link = 'Comment' })
  hl(0, '@comment.error', { fg = base46.base_30.base0B })
  hl(0, '@comment.warning', { fg = base46.base_30.base0A })
  hl(0, '@comment.todo', { link = 'Todo' })
  hl(0, '@comment.note', { fg = base46.base_30.base09 })
  hl(0, '@markup.strong', { fg = base46.base_30.base0C, bold = true })
  hl(0, '@markup.italic', { fg = base46.base_30.base0D, italic = true })
  hl(0, '@markup.strikethrough', { fg = base46.base_16.base03, strikethrough = true })
  hl(0, '@markup.underline', { link = 'Underlined' })
  hl(0, '@markup.heading', { fg = base46.base_30.base0G, bold = true })
  hl(0, '@markup.heading.1', { fg = base46.base_30.base0G })
  hl(0, '@markup.heading.2', { fg = base46.base_30.base0H })
  hl(0, '@markup.heading.3', { fg = base46.base_30.base0I })
  hl(0, '@markup.heading.4', { fg = base46.base_30.base0J })
  hl(0, '@markup.heading.5', { fg = base46.base_30.base0K })
  hl(0, '@markup.heading.6', { fg = base46.base_30.base0L })
  hl(0, '@markup.quote', { fg = base46.base_30.base0F })
  hl(0, '@markup.math', { link = '@markup.quote' })
  hl(0, '@markup.environment', { link = 'Comment' })
  hl(0, '@markup.link', { link = 'Underlined' })
  hl(0, '@markup.link.label', { fg = base46.base_30.base0E })
  hl(0, '@markup.link.url', { fg = base46.base_30.base0E })
  hl(0, '@markup.raw', { link = '@markup.quote' })
  hl(0, '@markup.raw.block', { fg = base46.base_30.base05 })
  hl(0, '@markup.list', { fg = base46.base_30.base09 })
  hl(0, '@markup.list.checked', { fg = base46.base_30.base06 })
  hl(0, '@markup.list.unchecked', { fg = base46.base_30.base05 })
  hl(0, '@diff.plus', { fg = base46.base_30.base06 })
  hl(0, '@diff.minus', { fg = base46.base_30.base08 })
  hl(0, '@diff.delta', { fg = base46.base_30.base07 })
  hl(0, '@tag', { fg = base46.base_30.base0M })
  hl(0, '@tag.builtin', { fg = base46.base_30.base0M })
  hl(0, '@tag.attribute', { fg = base46.base_30.base0N })
  hl(0, '@tag.delimiter', { fg = base46.base_30.base0O })
  hl(0, '@lsp.type.class', { link = 'Type' })
  hl(0, '@lsp.type.comment', {})
  hl(0, '@lsp.type.decorator', { link = 'Function' })
  hl(0, '@lsp.type.enum', { link = 'Type' })
  hl(0, '@lsp.type.enumMember', { link = 'Constant' })
  hl(0, '@lsp.type.event', { link = 'Function' })
  hl(0, '@lsp.type.function', { link = 'Function' })
  hl(0, '@lsp.type.interface', { link = 'Type' })
  hl(0, '@lsp.type.keyword', { link = 'Keyword' })
  hl(0, '@lsp.type.macro', { link = 'Constant' })
  hl(0, '@lsp.type.method', { link = 'Function' })
  -- hl(0,'@lsp.type.modifier')
  hl(0, '@lsp.type.namespace', { link = 'Type' })
  hl(0, '@lsp.type.number', { link = 'Number' })
  hl(0, '@lsp.type.operator', { link = 'Operator' })
  hl(0, '@lsp.type.parameter', { link = 'Parameter' })
  hl(0, '@lsp.type.property', { link = 'Property' })
  hl(0, '@lsp.type.regexp', { link = 'Special' })
  hl(0, '@lsp.type.string', { link = 'String' })
  hl(0, '@lsp.type.struct', { link = 'Type' })
  hl(0, '@lsp.type.type', { link = 'Type' })
  hl(0, '@lsp.type.typeParameter', { link = 'Type' })
  hl(0, '@lsp.type.variable', { link = 'Identifier' })
  hl(0, '@lsp.mod.readonly', { link = 'Constant' })
  hl(0, '@lsp.mod.global', { link = 'Constant' })

  hl(0, 'DiagnosticError', { fg = base46.base_30.base0B })
  hl(0, 'DiagnosticWarn', { fg = base46.base_30.base0A })
  hl(0, 'DiagnosticInfo', { fg = base46.base_30.base09 })
  hl(0, 'DiagnosticHint', { fg = base46.base_30.base09 })

  hl(
    0,
    'LspReferenceText',
    { fg = base46.base_16.base0E, bg = blend(base46.base_16.base0E, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'LspReferenceRead',
    { fg = base46.base_16.base0E, bg = blend(base46.base_16.base0E, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'LspReferenceWrite',
    { fg = base46.base_16.base0E, bg = blend(base46.base_16.base0E, base46.base_30.base00, 0.15) }
  )
  hl(
    0,
    'LspReferenceTarget',
    { fg = base46.magenta, bg = blend(base46.magenta, base46.base_30.base00, 0.15) }
  )
  hl(0, 'LspInlayHint', { fg = shade(base46.base_16.base0E, 4) })
  hl(0, 'LspCodeLens', { fg = shade(base46.base_16.base0E, 4) })
  hl(0, 'LspCodeLensSeparator', { fg = shade(base46.base_16.base0E, 4) })

  hl(
    0,
    'TelescopeTitle',
    { fg = base46.base_30.base0T, bg = blend(base46.base_30.base0T, base46.base_30.base00, 0.3) }
  )
  hl(0, 'TelescopeBorder', { link = 'FloatBorder' })
  hl(0, 'TelescopeSelection', { link = 'CursorLine' })
  hl(0, 'TelescopeSelectionCaret', { fg = base46.base_30.base0S, bg = base46.base_16.base02 })

  hl(0, 'DashboardHeader', { fg = base46.base_16.base03 })
  hl(0, 'DashboardFooter', { fg = base46.base_16.base0B })
  hl(0, 'DashboardIcon', { fg = base46.base_30.base0Q })
  hl(0, 'DashboardDesc', { fg = base46.base_30.base0Q })
  hl(0, 'DashboardKey', { fg = base46.base_16.base09 })

  hl(0, 'GitSignsAdd', { fg = base46.base_30.base06 })
  hl(0, 'GitSignsChange', { fg = base46.base_30.base07 })
  hl(0, 'GitSignsDelete', { fg = base46.base_30.base08 })

  hl(0, 'NvimTreeNormal', { bg = base46.base_30.base01 })
  hl(0, 'NvimTreeGitDeletedIcon', { fg = base46.base_30.base08 })
  hl(0, 'NvimTreeGitDirtyIcon', { fg = base46.base_30.base07 })
  hl(0, 'NvimTreeGitMergeIcon', { fg = base46.base_30.base06 })
  hl(0, 'NvimTreeGitNewIcon', { fg = base46.base_30.base06 })
  hl(0, 'NvimTreeGitRenamedIcon', { fg = base46.base_30.base07 })
  hl(0, 'NvimTreeGitStagedIcon', { fg = base46.base_30.base06 })

  hl(0, 'NeoTreeNormal', { fg = base46.base_30.base05, bg = base46.base_30.base01 })
  hl(0, 'NeoTreeGitDeleted', { fg = base46.base_30.base08 })
  hl(0, 'NeoTreeGitConflict', { fg = base46.base_30.base08 })
  hl(0, 'NeoTreeGitModified', { fg = base46.base_30.base07 })
  hl(0, 'NeoTreeGitAdded', { fg = base46.base_30.base06 })
  hl(0, 'NeoTreeGitUntracked', { fg = base46.base_16.base03 })

  hl(0, 'DiredDimText', { bg = base46.none, fg = base46.base_16.base03 })
  hl(0, 'DiredDirectoryName', { bg = base46.none, fg = base46.base_30.base0Q })
  hl(0, 'DiredDotfile', { bg = base46.none, fg = base46.base_16.base03 })
  hl(0, 'DiredFadeText1', { bg = base46.none, fg = base46.base_16.base03 })
  hl(0, 'DiredFadeText2', { bg = base46.none, fg = base46.green })
  hl(0, 'DiredSize', { bg = base46.none, fg = base46.none })
  hl(0, 'DiredUsername', { bg = base46.none, fg = base46.yellow })
  hl(0, 'DiredMonth', { bg = base46.none, fg = base46.none })
  hl(0, 'DiredDay', { bg = base46.none, fg = 'None' })
  hl(0, 'DiredFileName', { bg = base46.none, fg = base46.base_30.base04 })
  hl(0, 'DiredFileSuid', { bg = base46.base_16.base0A, fg = base46.base_30.base01 })
  hl(0, 'DiredNormal', { bg = base46.none, fg = base46.base_30.base0Q })
  hl(0, 'DiredNormalBold', { bg = base46.none, fg = base46.base_30.base04 })
  hl(0, 'DiredSymbolicLink', { bg = base46.none, fg = base46.base_30.base03 })
  hl(0, 'DiredBrokenLink', { bg = base46.base_30.base01, fg = base46.red })
  hl(0, 'DiredSymbolicLinkTarget', { bg = base46.base_30.base0E, fg = base46.base_30.base01 })
  hl(0, 'DiredBrokenLinkTarget', { bg = base46.base_30.base01, fg = base46.red })
  hl(0, 'DiredFileExecutable', { bg = base46.none, fg = base46.base_30.base0A })
  hl(0, 'DiredMarkedFile', { bg = base46.none, fg = base46.base_30.base09 })
  hl(0, 'DiredCopyFile', { bg = base46.none, fg = base46.base_30.base0S })
  hl(0, 'DiredMoveFile', { bg = base46.none, fg = base46.base_30.base0B })

  hl(0, 'CmpItemKindText', { fg = base46.base_16.base0B, reverse = true })
  hl(0, 'CmpItemKindTextDefault', { fg = base46.base_16.base0B, reverse = true })
  hl(0, 'CmpItemKindMethod', { fg = base46.base_16.base0D, reverse = true })
  hl(0, 'CmpItemKindFunction', { fg = base46.base_16.base0D, reverse = true })
  hl(0, 'CmpItemKindField', { fg = base46.base_16.base06, reverse = true })
  hl(0, 'CmpItemKindVariable', { fg = base46.base_16.base08, reverse = true })
  hl(0, 'CmpItemKindClass', { fg = base46.base_16.base0A, reverse = true })
  hl(0, 'CmpItemKindInterface', { fg = base46.base_16.base0A, reverse = true })
  hl(0, 'CmpItemKindModule', { fg = base46.base_16.base0A, reverse = true })
  hl(0, 'CmpItemKindProperty', { fg = base46.base_16.base06, reverse = true })
  hl(0, 'CmpItemKindUnit', { fg = base46.base_16.base09, reverse = true })
  hl(0, 'CmpItemKindEnum', { fg = base46.base_16.base0A, reverse = true })
  hl(0, 'CmpItemKindKeyword', { fg = base46.base_16.base0E, reverse = true })
  hl(0, 'CmpItemKindSnippet', { fg = base46.base_30.base0M, reverse = true })
  hl(0, 'CmpItemKindColor', { fg = base46.base_16.base0F, reverse = true })
  hl(0, 'CmpItemKindFile', { fg = base46.base_16.base05, reverse = true })
  hl(0, 'CmpItemKindReference', { fg = base46.base_30.base0E, reverse = true })
  hl(0, 'CmpItemKindFolder', { fg = base46.base_30.base0Q, reverse = true })
  hl(0, 'CmpItemKindEnumMember', { fg = base46.base_16.base09, reverse = true })
  hl(0, 'CmpItemKindConstant', { fg = base46.base_16.base09, reverse = true })
  hl(0, 'CmpItemKindStruct', { fg = base46.base_16.base0E, reverse = true })
  hl(0, 'CmpItemKindEvent', { fg = base46.base_16.base0F, reverse = true })
  hl(0, 'CmpItemKindOperator', { fg = base46.base_16.base0E, reverse = true })
  hl(0, 'CmpItemKindTypeParameter', { fg = base46.base_16.base0A, reverse = true })

  hl(0, 'NavicIconsFile', { fg = base46.base_30.base05 })
  hl(0, 'NavicIconsModule', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsNamespace', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsPackage', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsClass', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsMethod', { fg = base46.base_16.base0D })
  hl(0, 'NavicIconsProperty', { fg = base46.base_16.base06 })
  hl(0, 'NavicIconsField', { fg = base46.base_16.base06 })
  hl(0, 'NavicIconsConstructor', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsEnum', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsInterface', { fg = base46.base_16.base0A })
  hl(0, 'NavicIconsFunction', { fg = base46.base_16.base0D })
  hl(0, 'NavicIconsVariable', { fg = base46.base_16.base08 })
  hl(0, 'NavicIconsConstant', { fg = base46.base_16.base09 })
  hl(0, 'NavicIconsString', { fg = base46.base_16.base0B })
  hl(0, 'NavicIconsNumber', { fg = base46.base_16.base09 })
  hl(0, 'NavicIconsBoolean', { fg = base46.base_16.base09 })
  hl(0, 'NavicIconsArray', { fg = base46.base_16.base06 })
  hl(0, 'NavicIconsObject', { fg = base46.base_16.base06 })
  hl(0, 'NavicIconsKey', { fg = base46.base_16.base0E })
  hl(0, 'NavicIconsNull', { fg = base46.base_16.base09 })
  hl(0, 'NavicIconsEnumMember', { fg = base46.base_16.base09 })
  hl(0, 'NavicIconsStruct', { fg = base46.base_16.base07 })
  hl(0, 'NavicIconsEvent', { fg = base46.base_30.base0S })
  hl(0, 'NavicIconsOperator', { fg = base46.base_16.base05 })
  hl(0, 'NavicIconsTypeParameter', { fg = base46.base_16.base0A })
  hl(0, 'NavicText', { fg = base46.base_30.base05 })
  hl(0, 'NavicSeparator', { fg = base46.base_16.base0E })

  hl(0, 'MarkviewCode', { bg = base46.base_30.base01 })
  hl(0, 'MarkviewInlineCode', { bg = base46.base_30.base01 })
  hl(0, 'MarkviewCheckboxChecked', { fg = base46.blue })
  hl(0, 'MarkviewCheckboxUnchecked', { fg = base46.violet })
  hl(0, 'MarkviewCheckboxPending', { fg = base46.yellow })
  hl(0, 'MarkviewCheckboxProgress', { fg = base46.cyan })

  hl(0, 'ModeLineGitHead', { fg = base46.red })
  hl(0, 'ModeLineGitAdd', { link = 'GitSignsAdd' })
  hl(0, 'ModeLineGitChange', { link = 'GitSignsChange' })
  hl(0, 'ModeLineGitDelete', { link = 'GitSignsDelete' })
  hl(0, 'ModeLineLspProgress', { fg = base46.base_30.base0S })

  hl(0, 'ModeLineBrand', { fg = base46.green })
  hl(0, 'ModeLineMode', { fg = base46.base_30.base0S })
  hl(0, 'ModeLineFile', { fg = base46.violet })

  hl(0, 'HydraRed', { fg = base46.red })
  hl(0, 'HydraAmaranth', { fg = base46.violet })
  hl(0, 'HydraTeal', { fg = base46.blue })
  hl(0, 'HydraPink', { fg = base46.magenta })

  hl(0, 'IblColumn', { bg = shade(base46.base_30.base00, 1.5) })

  hl(0, 'RainbowDelimiterRed', { fg = base46.red })
  hl(0, 'RainbowDelimiterBlue', { fg = base46.blue })
  hl(0, 'RainbowDelimiterYellow', { fg = base46.yellow })
  hl(0, 'RainbowDelimiterOrange', { fg = base46.orange })
  hl(0, 'RainbowDelimiterGreen', { fg = base46.green })
  hl(0, 'RainbowDelimiterViolet', { fg = base46.violet })
  hl(0, 'RainbowDelimiterCyan', { fg = base46.cyan })

  hl(0, 'MasonHeader', { link = 'FloatTitle' })
  hl(0, 'MasonHighlight', { fg = base46.base_30.base0S })
  hl(
    0,
    'MasonHighlightBlock',
    { fg = blend(base46.base_30.base0S, base46.base_30.base01, 0.15), bg = base46.base_30.base0S }
  )
  hl(0, 'MasonHighlightBlockBold', {
    fg = blend(base46.base_30.base0S, base46.base_30.base01, 0.15),
    bg = base46.base_30.base0S,
    bold = true,
  })

  hl(0, 'CmpItemKindSupermaven', { link = 'CmpItemKindEvent' })

  if not vim.tbl_isempty(base46.groups or {}) then
    for name, val in pairs(base46.groups) do
      hl(0, name, val)
    end
  end
  if vim.g.base46 then
    vim.defer_fn(function()
      vim.api.nvim_del_var 'base46'
    end, 800)
  end
end

return M
