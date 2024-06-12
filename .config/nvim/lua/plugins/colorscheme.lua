return {
  {
    'maxmx03/fluoromachine.nvim',
    branch = 'dev',
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
  {
    'maxmx03/dracula.nvim',
  },
}
