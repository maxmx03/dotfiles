return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      local color = require 'core.color'
      local colors = require 'rose-pine.palette'
      local background = color.shade(colors.base, 2)
      local transparent = true

      local hl = function(...)
        return vim.api.nvim_set_hl(0, ...)
      end

      if transparent then
        hl('BufferLineFill', { bg = background })
        hl('BufferLineSeparator', { fg = background })
        hl('BufferLineSeparatorSelected', { fg = background })
        hl('BufferLineSeparatorVisible', { fg = background })
      end

      require('rose-pine').setup {
        variant = 'auto',
        dark_variant = 'main',
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        highlight_groups = {
          NeoTreeNormal = { bg = 'base' },
          NeoTreeNormalNC = { bg = 'base' },
          NormalFloat = { bg = 'base' },
          Pmenu = { fg = 'text', bg = 'base' },
          WinSeparator = { bg = 'base' },
          FloatBorder = { link = 'WinSeparator' },
          Directory = { fg = 'foam' },
          StatusLine = { bg = 'base' },
          StatusLineNC = { bg = 'base' },
          ['@lsp.type.string'] = { link = '@string' },
          ['@markup.link.label'] = { link = '@markup.link' },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
