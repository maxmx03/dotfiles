return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local config = require 'core.dashboard'

      require('dashboard').setup {
        theme = 'doom',
        config = config,
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
