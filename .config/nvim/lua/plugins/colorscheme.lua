return {
  {
    'maxmx03/hydra.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@type hydra
      local hydra = require 'hydra'

      hydra.setup {}

      vim.cmd.colorscheme 'hydra'
    end,
  },
}
