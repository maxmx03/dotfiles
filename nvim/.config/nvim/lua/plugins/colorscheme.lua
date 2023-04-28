return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    branch = 'draculapro',
    config = function()
      local dracula = require 'dracula'
      local draculapro = require 'draculapro'

      draculapro.setup {
        theme = 'pro',
      }

      dracula.setup {
        colors = draculapro.colors,
        dracula_pro = draculapro,
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
            TelescopeResultsBorder = { fg = c.bgdark, bg = c.bgdark },
            TelescopeResultsNormal = { bg = c.bgdark },
            TelescopePreviewNormal = { bg = c.bg },
            TelescopePromptBorder = { fg = c.bgdark, bg = c.bgdark },
            TelescopePromptPrefix = { fg = c.purple },
            CmpItemKindBorder = { fg = c.bgdark, bg = c.bgdark },
          }
        end,
      }

      vim.cmd.colorscheme 'dracula'
    end,
    dependencies = {
      'maxmx03/draculapro',
    },
  },
}
