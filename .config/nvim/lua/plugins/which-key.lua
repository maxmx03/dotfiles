return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'
    local keymaps = require 'editor.keymaps'
    wk.add(keymaps.normal)
    wk.add(keymaps.visual)
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
