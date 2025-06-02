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
      local keymaps = require 'config.which-key.keymaps'
      wk.add(keymaps)
      wk.setup {
        preset = 'modern',
      }
    end,
  },
  {
    'nvimtools/hydra.nvim',
    config = function()
      local Hydra = require 'hydra'
      local cmd = require('hydra.keymap-util').cmd
      require('config.hydra.telescope').load(Hydra, cmd)
      require('config.hydra.folding').load(Hydra)
    end,
  },
}
