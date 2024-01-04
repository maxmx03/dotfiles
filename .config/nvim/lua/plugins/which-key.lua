return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      local keymappings = require 'milianor.keymappings'

      wk.register(keymappings.normal, { prefix = '<space>', mode = 'n' })
      wk.register(keymappings.visual, { prefix = '<space>', mode = 'v' })
      wk.setup {
        window = {
          border = 'single',   -- none, single, double, shadow
          position = 'bottom', -- bottom, top
        },
      }
    end,
  },
}
