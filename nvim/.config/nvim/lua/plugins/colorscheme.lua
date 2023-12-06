return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      _G.colors = require('tokyonight.colors').default

      require('tokyonight').setup {
        on_highlights = function(group, c)
          local util = require('tokyonight.util')
          local darken = util.darken

          group.LspInlayHint = {
            fg = darken(c.blue1, 0.7),
            bg = 'NONE',
          }

          group['@lsp.typemod.function.defaultLibrary'] = {
            link = 'Function'
          }
        end,
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
