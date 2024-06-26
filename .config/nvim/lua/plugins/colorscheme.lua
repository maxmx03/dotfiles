return {
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@type fluoromachine
      local fm = require 'fluoromachine'

      fm.setup {
        glow = flse,
        theme = 'retrowave',
        transparent = true,
      }

      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
}
