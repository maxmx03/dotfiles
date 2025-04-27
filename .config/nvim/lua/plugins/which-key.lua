return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
    config = function()
      local wk = require 'which-key'
      local keymaps = require 'config.keymaps'
      wk.add(keymaps)
      wk.setup {
        preset = 'modern',
      }
    end,
  },
}
