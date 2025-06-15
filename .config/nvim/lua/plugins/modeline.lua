local core = require 'core'

return {
  {
    dir = core.include 'modeline',
    opts = {},
    dependencies = {
      'lewis6991/gitsigns.nvim',
    },
  },
}
