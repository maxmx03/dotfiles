return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      local keymaps = require 'keymaps'

      wk.register(keymaps.normal, { prefix = '<space>', mode = 'n' })
      wk.register(keymaps.visual, { prefix = '<space>', mode = 'v' })
      wk.setup {
        window = {
          border = 'single', -- none, single, double, shadow
          position = 'bottom', -- bottom, top
        },
      }
    end,
  },
}
