return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local dracula = require 'dracula'

      dracula.setup {
        override = function(c)
          return {
            CmpItemKindText = { reverse = true },
            CmpItemKindMethod = { reverse = true },
            CmpItemKindFunction = { reverse = true },
            CmpItemKindConstructor = { reverse = true },
            CmpItemKindField = { reverse = true },
            CmpItemKindVariable = { reverse = true },
            CmpItemKindClass = { reverse = true },
            CmpItemKindInterface = { reverse = true },
            CmpItemKindModule = { reverse = true },
            CmpItemKindProperty = { reverse = true },
            CmpItemKindUnit = { reverse = true },
            CmpItemKindValue = { reverse = true },
            CmpItemKindEnum = { reverse = true },
            CmpItemKindKeyword = { reverse = true },
            CmpItemKindSnippet = { reverse = true },
            CmpItemKindColor = { reverse = true },
            CmpItemKindFile = { reverse = true },
            CmpItemKindReference = { reverse = true },
            CmpItemKindFolder = { reverse = true },
            CmpItemKindEnumMember = { reverse = true },
            CmpItemKindConstant = { reverse = true },
            CmpItemKindStruct = { reverse = true },
            CmpItemKindEvent = { reverse = true },
            CmpItemKindOperator = { reverse = true },
            CmpItemKindTypeParameter = { reverse = true },
            TelescopeResultsBorder = { fg = c.float_bg, bg = c.float_bg },
            TelescopeResultsNormal = { bg = c.float_bg },
            TelescopePreviewNormal = { bg = c.bg },
            TelescopePromptBorder = { fg = c.float_bg, bg = c.float_bg },
            TelescopeTitle = { fg = c.fg, bg = c.comment },
            TelescopePromptPrefix = { fg = c.purple },
            CmpItemKindBorder = { fg = c.float_bg, bg = c.float_bg },
          }
        end,
      }

      vim.cmd.colorscheme 'dracula'
    end,
  },
}
