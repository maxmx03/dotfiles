return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'
    local keymaps = require 'editor.keymaps'
    wk.add(keymaps)
    wk.setup {
      preset = 'modern',
      icons = {
        mappings = false,
        keys = {
          Space = '',
        },
      },
    }
  end,
}
