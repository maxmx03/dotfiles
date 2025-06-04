local core = require 'core'

return {
  {
    dir = core.include 'modeline',
    opts = {},
    dependencies = {
      'lewis6991/gitsigns.nvim',
    },
  },
  {
    dir = core.include 'base46',
    lazy = false,
    priority = 1000,
    opts = vim.g.base46,
  },
}
