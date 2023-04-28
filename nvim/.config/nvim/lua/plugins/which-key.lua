return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      local keymappings = require 'milianor.keymappings'

      wk.register(keymappings, { prefix = '<space>' })
      wk.setup {
        icons = {
          group = '',
        },
      }
    end,
  },
}
