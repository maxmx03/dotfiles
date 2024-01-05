return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      local keymaps = require 'milianor.keymaps'

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
