local filemanager = require 'include.filemanager'

return {
  {
    dir = filemanager.core_plugin 'modeline',
    opts = {},
    dependencies = {
      'lewis6991/gitsigns.nvim',
    },
  },
  {
    dir = filemanager.core_plugin 'base46',
    lazy = false,
    priority = 1000,
    opts = vim.g.base46,
  },
}
