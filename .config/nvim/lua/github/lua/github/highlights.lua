local c = require 'github.colors'
local color = require 'github.color'

local M = {}

local function nvim_get_hl(opts)
  local hl = vim.api.nvim_get_hl(0, opts)

  if hl.link then
    return nvim_get_hl { name = hl.link }
  end

  return hl
end

---@class hi.config
---@field transparent? boolean
---@field error_lens? boolean
---@field mix? 'fg' | 'bg'

---@param group_name string
---@param group_val vim.api.keyset.highlight
---@param config? hi.config
local hi = function(group_name, group_val, config)
  local val = { fg = 'NONE', bg = 'NONE' }

  if not group_val.link then
    if config then
      if config.transparent then
        group_val.bg = 'NONE'
      end

      if config.mix then
        local ok, mix_color
        if config.mix == 'fg' then
          ok, mix_color = pcall(color.blend, group_val.bg, c.base03, 0.3)
        else
          ok, mix_color = pcall(color.blend, group_val.fg, c.base03, 0.3)
        end
        if ok then
          group_val[config.mix] = mix_color
        end
      end

      if config.error_lens then
        local ok, mix_color = pcall(color.blend, group_val.fg, c.base03, 0.3)
        if ok then
          group_val.bg = mix_color
        end
      end
    end

    val = vim.tbl_extend('force', val, group_val)
    vim.api.nvim_set_hl(0, group_name, val)
  else
    vim.api.nvim_set_hl(0, group_name, group_val)
  end
end

---@param config github.config
M.load = function(config)
  if config.on_colors then
    c = vim.tbl_extend('force', c, config.on_colors(c, color))
  end

  hi('ColorColumn', { bg = c.base02 })
  hi('Conceal', { fg = c.blue })
  hi('CurSearch', { link = 'IncSearch' })
  hi('Cursor', { fg = c.base03, bg = c.base0 })
  hi('lCursor', { link = 'Cursor' })
  hi('CursorIM', { link = 'Cursor' })
  hi('CursorColumn', { link = 'ColorColumn' })
  hi('CursorLine', { bg = c.base02 })
  hi('Directory', { fg = c.blue })
  hi('DiffAdd', { fg = c.git_add })
  hi('DiffChange', { fg = c.git_modify })
  hi('DiffDelete', { fg = c.git_delete, reverse = true })
  hi('DiffText', { fg = c.cyan, reverse = true })
  hi('EndOfBuffer', { fg = c.base03 })
  hi('TermCursor', { link = 'Cursor' })
  hi('TermCursorNC', { fg = c.base03, bg = c.base0 })
  hi('ErrorMsg', { fg = c.diag_error })
  hi('WinSeparator', { fg = c.base01, bg = c.base03 }, { transparent = config.transparent.enabled })
  hi('Folded', { fg = c.base0, bg = c.base02 })
  hi('FoldColumn', { fg = c.base0, bg = c.base03 })
  hi('SignColumn', { fg = c.base01 })
  hi('IncSearch', { fg = c.yellow, reverse = true })
  hi('Substitute', { link = 'IncSearch' })
  hi('LineNr', { fg = c.base01 })
  hi('LineNrAbove', { link = 'LineNr' })
  hi('LineNrBelow', { link = 'LineNr' })
  hi(
    'CursorLineNr',
    { fg = c.blue, bg = c.base02, bold = true },
    { transparent = config.transparent.enabled }
  )
  hi('CursorLineFold', { link = 'FoldColumn' })
  hi('CursorLineSign', { link = 'SignColumn' })
  hi('MatchParen', { fg = c.cyan })
  hi('ModeMsg', { fg = c.blue })
  hi('MsgArea', { link = 'Normal' })
  hi('MsgSeparator', { link = 'Normal' })
  hi('MoreMsg', { link = 'ModeMsg' })
  hi('NonText', { fg = c.base01 })
  hi('Normal', { fg = c.base0, bg = c.base03 }, { transparent = config.transparent.enabled })
  hi(
    'NormalFloat',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.normalfloat }
  )
  hi('FloatBorder', { fg = c.base01, bg = c.base04 }, { transparent = config.transparent.enabled })
  hi('FloatTitle', { bg = c.blue, reverse = true }, { mix = 'fg' })
  hi('NormalNC', { link = 'Normal' })
  hi(
    'Pmenu',
    { fg = c.base0, bg = c.base03 },
    { transparent = config.transparent.enabled and config.transparent.pmenu }
  )
  hi('PmenuSel', { fg = c.blue, reverse = true })
  hi('PmenuKind', { link = 'Pmenu' })
  hi('PmenuKindSel', { link = 'PmenuSel' })
  hi('PmenuExtra', { link = 'Pmenu' })
  hi('PmenuExtraSel', { link = 'PmenuSel' })
  hi('PmenuSbar', { bg = c.base03 })
  hi('PmenuThumb', { bg = c.blue })
  hi('Question', { fg = c.diag_info })
  hi('QuickFixLine', { fg = c.base0, bg = c.base03 })
  hi('Search', { fg = c.blue, bold = true }, { mix = 'bg' })
  hi('SpecialKey', { link = 'NonText' })
  hi('SpellBad', { underline = true, strikethrough = true })
  hi('SpellCap', { fg = c.diag_hint })
  hi('SpellLocal', { link = 'SpellCap' })
  hi('SpellRare', { fg = c.diag_warning })
  hi('StatusLine', { fg = c.base0, bg = c.base03 })
  hi('StatusLineNC', { fg = c.base01, bg = c.base03 })
  hi('TabLine', { fg = c.base01, bg = c.base03 })
  hi('TabLineFill', { fg = c.base0, bg = c.base03 })
  hi('TabLineSel', { fg = c.base0, bg = c.base03 })
  hi('Title', { fg = c.blue })
  hi('Visual', { fg = c.purple }, { mix = 'bg' })
  hi('VisualNOS', { link = 'Visual' })
  hi('warningMsg', { fg = c.diag_warning })
  hi('Whitespace', { fg = c.base01 })
  hi('WildMenu', { fg = c.base02 })
  hi('WinBar', { link = 'Pmenu' })
  hi('WinBarNC', { link = 'WinBar' })

  hi('Comment', { fg = c.base01 })
  hi('Constant', { fg = c.blue })
  hi('String', { fg = c.cyan })
  hi('Character', { link = 'String' })
  hi('Number', { link = 'Constant' })
  hi('Boolean', { link = 'Constant' })
  hi('Float', { link = 'Constant' })
  hi('Identifier', { fg = c.base0 })
  hi('Property', { fg = c.purple })
  hi('Parameter', { fg = c.orange, italic = true })
  hi('Function', { fg = c.blue })
  hi('Statement', { fg = c.red })
  hi('Conditional', { link = 'Statement' })
  hi('Repeat', { link = 'Statement' })
  hi('Label', { link = 'Statement' })
  hi('Operator', { link = 'Operator' })
  hi('Keyword', { fg = c.red })
  hi('Exception', { link = 'Statement' })
  hi('Include', { link = 'Keyword' })
  hi('Define', { link = 'Include' })
  hi('Macro', { link = 'Include' })
  hi('PreProc', { link = 'Include' })
  hi('PreCondit', { link = 'Statement' })
  hi('Type', { fg = c.yellow })
  hi('StorageClass', { link = 'Statement' })
  hi('Structure', { link = 'Type' })
  hi('Typedef', { link = 'Statement' })
  hi('Special', { fg = c.purple })
  hi('SpecialChar', { fg = c.purple })
  hi('Tag', { fg = c.green })
  hi('TagAttribute', { fg = c.blue })
  hi('TagDelimiter', { fg = c.base0 })
  hi('Delimiter', { fg = c.base0 })
  hi('SpecialComment', { link = 'Statement' })
  hi('Debug', { fg = c.purple })
  hi('Underlined', { fg = c.purple, underline = true })
  hi('Ignore', {})
  hi('Error', { fg = c.diag_error, bold = true })
  hi('Todo', { fg = c.blue })
  hi('Added', { fg = c.git_add })
  hi('Changed', { fg = c.git_modify })
  hi('Removed', { fg = c.git_delete })

  hi('@variable', { link = 'Identifier' })
  hi('@variable.builtin', { link = 'Constant' })
  hi('@variable.parameter', { link = 'Parameter' })
  hi('@variable.member', { link = 'Property' })
  hi('@variable.scss', { link = 'Constant' })
  hi('@property', { link = 'Property' })
  hi('@property.json', { link = 'Keyword' })
  hi('@property.yaml', { link = 'Keyword' })
  hi('@constant', { link = 'Constant' })
  hi('@constant.builtin', { link = 'Constant' })
  hi('@constant.macro', { link = 'Constant' })
  hi('@constant.html', { link = 'Tag' })
  hi('@module', { link = 'Type' })
  hi('@module.builtin', { link = 'Constant' })
  hi('@label', { link = 'Statement' })
  hi('@string', { link = 'String' })
  hi('@string.documentation', { link = 'Statement' })
  hi('@string.regexp', { fg = c.purple })
  hi('@string.escape', { link = 'Statement' })
  hi('@string.special', { link = 'Special' })
  hi('@string.special.symbol', { link = 'Identifier' })
  hi('@string.special.url', { link = 'Underlined' })
  hi('@character', { link = 'Constant' })
  hi('@character.special', { link = 'Constant' })
  hi('@character.printf', { link = 'Keyword' })
  hi('@type', { link = 'Type' })
  hi('@type.builtin', { link = 'Keyword' })
  hi('@type.definition', { link = 'Type' })
  hi('@type.qualifier', { link = 'Type' })
  hi('@attribute', { link = 'Keyword' })
  hi('@function', { link = 'Function' })
  hi('@function.bash', { link = 'Type' })
  hi('@function.builtin', { link = 'Function' })
  hi('@function.call', { link = 'Function' })
  hi('@function.call.bash', { link = 'Type' })
  hi('@function.macro', { link = 'Function' })
  hi('@function.method', { link = 'Function' })
  hi('@function.method.call', { link = 'Function' })
  hi('@constructor', { link = 'Type' })
  hi('@constructor.lua', { link = 'Delimiter' })
  hi('@operator', { link = 'Statement' })
  hi('@keyword', { link = 'Keyword' })
  hi('@keyword.coroutine', { link = 'Statement' })
  hi('@keyword.function', { link = 'Keyword' })
  hi('@keyword.type', { link = 'Keyword' })
  hi('@keyword.operator', { link = 'Statement' })
  hi('@keyword.import', { link = 'Include' })
  hi('@keyword.repeat', { link = 'Statement' })
  hi('@keyword.return', { link = 'Statement' })
  hi('@keyword.debug', { link = 'Keyword' })
  hi('@keyword.exception', { link = 'Statement' })
  hi('@keyword.conditional', { link = 'Statement' })
  hi('@keyword.conditional.ternary', { link = 'Statement' })
  hi('@keyword.directive', { link = 'Statement' })
  hi('@keyword.directive.define', { link = 'Statement' })
  hi('@punctuation.delimiter', { link = 'Delimiter' })
  hi('@punctuation.bracket', { link = 'Delimiter' })
  hi('@punctuation.special', { link = 'Keyword' })
  hi('@comment', { link = 'Comment' })
  hi('@comment.documentation', { link = 'Comment' })
  hi('@comment.error', { fg = c.diag_error })
  hi('@comment.warning', { fg = c.diag_warning })
  hi('@comment.todo', { link = 'Todo' })
  hi('@comment.note', { fg = c.diag_hint })
  hi('@markup.strong', { fg = c.purple, bold = true })
  hi('@markup.italic', { fg = c.purple, italic = true })
  hi('@markup.strikethrough', { fg = c.base01, strikethrough = true })
  hi('@markup.underline', { link = 'Underlined' })
  hi('@markup.heading', { fg = c.blue, bold = true })
  hi('@markup.heading.1', { fg = c.blue })
  hi('@markup.heading.2', { fg = c.green })
  hi('@markup.heading.3', { fg = c.yellow })
  hi('@markup.heading.4', { fg = c.orange })
  hi('@markup.heading.5', { fg = c.red })
  hi('@markup.heading.6', { fg = c.purple })
  hi('@markup.quote', { fg = c.diag_ok })
  hi('@markup.math', { fg = c.purple })
  hi('@markup.environment', { link = 'Comment' })
  hi('@markup.link', { link = 'Underlined' })
  hi('@markup.link.label', { link = 'Constant' })
  hi('@markup.link.url', { link = 'Underlined' })
  hi('@markup.raw', { fg = c.cyan })
  hi('@markup.raw.block', { fg = c.base0 })
  hi('@markup.list', { fg = c.orange })
  hi('@markup.list.checked', { fg = c.green })
  hi('@markup.list.unchecked', { fg = c.base01 })
  hi('@diff.plus', { fg = c.git_add })
  hi('@diff.minus', { fg = c.git_delete })
  hi('@diff.delta', { fg = c.git_modify })
  hi('@tag', { link = 'Tag' })
  hi('@tag.builtin', { fg = c.red })
  hi('@tag.attribute', { link = 'TagAttribute' })
  hi('@tag.delimiter', { link = 'TagDelimiter' })
  hi('@operator.html', { fg = c.base0 })

  hi('@lsp.type.class', { link = 'Type' })
  hi('@lsp.type.decorator', { link = 'Function' })
  hi('@lsp.type.enum', { link = 'Type' })
  hi('@lsp.type.enumMember', { link = 'Type' })
  hi('@lsp.type.interface', { link = 'Type' })
  hi('@lsp.type.macro', { link = '@function.builtin' })
  hi('@lsp.type.namespace', { link = 'Type' })
  hi('@lsp.type.parameter', { link = 'Parameter' })
  hi('@lsp.type.property', { link = 'Property' })
  hi('@lsp.type.struct', { link = 'Type' })
  hi('@lsp.type.type', { link = 'Type' })
  hi('@lsp.type.typeParameter', { link = 'Type' })
  hi('@lsp.type.variable', { link = 'Identifier' })
  hi('@lsp.typemod.variable.defaultLibrary', { link = 'Constant' })
  hi('@lsp.typemod.variable.readonly', { link = 'Constant' })
  hi('@lsp.typemod.variable.global', { link = 'Constant' })
  hi('@lsp.typemod.keyword.documentation', { link = 'Keyword' })
  hi('@lsp.typemod.class.documentation', { link = 'Type' })
  hi('@lsp.typemod.property.readonly', { link = 'Constant' })
  hi('DiagnosticError', { fg = c.diag_error })
  hi('DiagnosticWarn', { fg = c.diag_warning })
  hi('DiagnosticInfo', { fg = c.diag_info })
  hi('DiagnosticHint', { fg = c.diag_hint })
  hi('DiagnosticOk', { fg = c.diag_ok })
  hi('DiagnosticVirtualTextError', { fg = c.diag_error }, { error_lens = config.error_lens.text })
  hi('DiagnosticVirtualTextWarn', { fg = c.diag_warning }, { error_lens = config.error_lens.text })
  hi('DiagnosticVirtualTextInfo', { fg = c.diag_info }, { error_lens = config.error_lens.text })
  hi('DiagnosticVirtualTextHint', { fg = c.diag_hint }, { error_lens = config.error_lens.text })
  hi('DiagnosticVirtualTextOk', { fg = c.diag_ok }, { error_lens = config.error_lens.text })
  hi('DiagnosticUnderlineError', { fg = c.diag_error, underline = true, sp = c.diag_error })
  hi('DiagnosticUnderlineWarn', { fg = c.diag_warning, underline = true, sp = c.diag_warning })
  hi('DiagnosticUnderlineInfo', { fg = c.diag_info, underline = true, sp = c.diag_info })
  hi('DiagnosticUnderlineHint', { fg = c.diag_hint, underline = true, sp = c.diag_hint })
  hi('DiagnosticUnderlineOk', { fg = c.diag_ok, underline = true, sp = c.diag_ok })
  hi('DiagnosticSignError', { fg = c.diag_error }, { error_lens = config.error_lens.symbol }) -- Used for "Error" signs in sign column.
  hi('DiagnosticSignWarn', { fg = c.diag_warning }, { error_lens = config.error_lens.symbol }) -- Used for "Warn" signs in sign column.
  hi('DiagnosticSignInfo', { fg = c.diag_info }, { error_lens = config.error_lens.symbol }) -- Used for "Info" signs in sign column.
  hi('DiagnosticSignHint', { fg = c.diag_hint }, { error_lens = config.error_lens.symbol }) -- Used for "Hint" signs in sign column.
  hi('DiagnosticSignOk', { fg = c.diag_ok })
  hi('LspReferenceText', { fg = c.cyan }, { mix = 'bg' })
  hi('LspReferenceRead', { fg = c.green }, { mix = 'bg' })
  hi('LspReferenceWrite', { fg = c.green }, { mix = 'bg' })
  hi('LspInlayHint', { fg = color.shade(c.cyan, 3) })
  hi('CmpBorder', { fg = c.base01, bg = c.base03 }, { transparent = config.transparent.enabled })
  hi('CmpItemKindText', { link = 'String' })
  hi('CmpItemKindMethod', { link = 'Function' })
  hi('CmpItemKindFunction', { link = 'Function' })
  hi('CmpItemKindField', { link = 'Property' })
  hi('CmpItemKindVariable', { link = 'Identifier' })
  hi('CmpItemKindClass', { link = 'Type' })
  hi('CmpItemKindInterface', { link = 'Type' })
  hi('CmpItemKindModule', { link = 'Type' })
  hi('CmpItemKindProperty', { link = 'Property' })
  hi('CmpItemKindUnit', { link = 'Number' })
  hi('CmpItemKindEnum', { link = 'Type' })
  hi('CmpItemKindKeyword', { link = 'Keyword' })
  hi('CmpItemKindSnippet', { link = 'Tag' })
  hi('CmpItemKindColor', { link = 'Special' })
  hi('CmpItemKindFile', { link = 'Identifier' })
  hi('CmpItemKindReference', { link = 'Underlined' })
  hi('CmpItemKindFolder', { link = 'Directory' })
  hi('CmpItemKindEnumMember', { link = 'Constant' })
  hi('CmpItemKindConstant', { link = 'Constant' })
  hi('CmpItemKindStruct', { link = 'Identifier' })
  hi('CmpItemKindEvent', { link = 'Function' })
  hi('CmpItemKindOperator', { link = 'Operator' })
  hi('CmpItemKindTypeParameter', { link = 'Type' })

  hi('NeoTreeTitleBar', { fg = c.cyan }, { mix = 'bg' })
  hi(
    'NeoTreeNormal',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.neotree }
  )
  hi('NeoTreeNormalNC', { link = 'NeoTreeNormal' })
  hi('NeoTreeDotFile', { fg = c.base01 })
  hi('NeoTreeGitIgnored', { link = 'NeoTreeDotFile' })
  hi('NeoTreeFileStats', { link = 'NeoTreeDotFile' })
  hi('NeoTreeDimText', { link = 'NeoTreeDotFile' })
  hi('NeoTreeFileNameOpened', { link = 'Directory' })
  hi('NeoTreeFloatBorder', { link = 'WinSeparator' })
  hi('NeoTreeFloatTitle', { link = 'Title' })
  hi('NeoTreeGitAdded', { fg = c.git_add })
  hi('NeoTreeGitConflict', { fg = c.git_modify })
  hi('NeoTreeGitDeleted', { fg = c.git_delete })
  hi('NeoTreeGitModified', { fg = c.git_modify })
  hi('NeoTreeGitUnstaged', { fg = c.git_modify })
  hi('NeoTreeGitUntracked', { fg = c.git_modify })
  hi('NeoTreeGitStaged', { fg = c.git_add })

  hi(
    'WhichKeyNormal',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.whichkey }
  )
  hi(
    'WhichKeyBorder',
    { fg = c.base01, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.whichkey }
  )
  hi('WhichKey', { link = 'Property' })
  hi('WhichKeyDesc', { link = 'String' })
  hi('WhichKeySeparator', { link = 'Keyword' })
  hi('WhichKeyGroup', { link = 'Constant' })

  hi('DashboardHeader', { fg = c.base01 })
  hi('DashboardFooter', { fg = c.purple })
  hi('DashboardDesc', { link = 'Directory' })
  hi('DashboardKey', { link = 'Keyword' })
  hi('DashboardIcon', { link = 'Directory' })
  hi('DashboardShotCut', { fg = c.base0 })

  hi('GitSignsAdd', { fg = c.git_add })
  hi('GitSignsChange', { fg = c.git_modify })
  hi('GitSignsDelete', { fg = c.git_delete })

  hi('TelescopeSelection', { fg = c.blue, bg = c.base02 })
  hi('TelescopeSelectionCaret', { fg = c.blue, bg = c.base02 })
  hi('TelescopeMultiIcon', { fg = c.blue })
  hi(
    'TelescopeNormal',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.telescope }
  )
  hi('TelescopePreviewNormal', { link = 'TelescopeNormal' })
  hi('TelescopePromptNormal', { link = 'TelescopeNormal' })
  hi('TelescopeResultsNormal', { link = 'TelescopeNormal' })
  hi('TelescopeBorder', { link = 'FloatBorder' })
  hi('TelescopePromptBorder', { link = 'TelescopeBorder' })
  hi('TelescopeResultsBorder', { link = 'TelescopeBorder' })
  hi('TelescopePreviewBorder', { link = 'TelescopeBorder' })
  hi('TelescopeTitle', { link = 'FloatTitle' })
  hi('TelescopePromptTitle', { link = 'TelescopeTitle' })
  hi('TelescopeResultsTitle', { link = 'TelescopeTitle' })
  hi('TelescopePreviewTitle', { link = 'TelescopeTitle' })
  hi('TelescopeMatching', { fg = c.cyan }, { mix = 'bg' })
  hi('TelescopePreviewMatch', { link = 'TelescopeMatching' })
  hi('TelescopePromptCounter', { link = 'NonText' })
  hi('TelescopePromptPrefix', { fg = c.cyan })

  hi('HopNextKey', { fg = c.purple })
  hi('HopNextKey1', { fg = c.blue })
  hi('HopNextKey2', { fg = c.cyan })
  hi('HopUnmatched', { fg = c.base01 })

  if config.transparent.enabled then
    hi('BufferLineFill', { bg = c.base03 })
    hi('BufferLineBufferSelected', { fg = c.base0 })
    hi('BufferLineSeparator', { fg = c.base03 })
    hi('BufferLineSeparatorSelected', { fg = c.base03 })
    hi('BufferLineSeparatorVisible', { fg = c.base04 })
  end

  hi('RenderMarkdownH1Bg', { fg = c.blue }, { mix = 'bg' })
  hi('RenderMarkdownH2Bg', { fg = c.green }, { mix = 'bg' })
  hi('RenderMarkdownH3Bg', { fg = c.yellow }, { mix = 'bg' })
  hi('RenderMarkdownH4Bg', { fg = c.orange }, { mix = 'bg' })
  hi('RenderMarkdownH5Bg', { fg = c.red }, { mix = 'bg' })
  hi('RenderMarkdownH6Bg', { fg = c.purple }, { mix = 'bg' })
  hi('RenderMarkdownCode', { bg = c.base03 })
  hi('RenderMarkdownBullet', { fg = c.cyan })

  hi(
    'LazyNormal',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.lazy }
  )
  hi(
    'MasonNormal',
    { fg = c.base0, bg = c.base04 },
    { transparent = config.transparent.enabled and config.transparent.mason }
  )
  hi('MasonHeader', { fg = c.red, reverse = true })
  hi('MasonHighlight', { fg = c.red })
  hi('MasonHighlightBlock', { bg = c.red }, { mix = 'fg' })
  hi('MasonHighlightBlockBold', { bg = c.red, bold = true }, { mix = 'fg' })

  if config.on_highlights then
    local highlights = config.on_highlights(c, color)
    for group_name, group_val in pairs(highlights) do
      local hl = nvim_get_hl { name = group_name, link = true }
      local val = {}
      if hl.link then
        val = group_val
      else
        val = vim.tbl_extend('force', hl, group_val)
      end
      vim.api.nvim_set_hl(0, group_name, val)
    end
  end
end

return M
