return {
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@type fluoromachine
      local fm = require 'fluoromachine'

      fm.setup {
        glow = true,
        theme = 'retrowave',
      }

      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
}
