local core = require 'core'

return {
  {
    dir = core.include 'base46',
    lazy = false,
    priority = 1000,
    opts = vim.g.base46,
  },
}
