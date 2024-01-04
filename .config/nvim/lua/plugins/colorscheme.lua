return {
  {
    'maxmx03/hydra.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@type hydra
      local hydra = require 'hydra'

      hydra.setup {
        modules = {
          neogit = false,
          illuminate = false,
          blankline = false,
          saga = false,
        },
      }

      vim.cmd.colorscheme 'hydra'
    end,
  },
}
