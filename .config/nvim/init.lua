vim.loader.enable()
require 'config.lazy'
require 'config.globals'
require 'config.options'
require 'config.commands'
require 'config.autocmds'

---@type base46
local base46 = require 'base46'
base46.restore()
base46.reload()

require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'base46' } },
  checker = { enabled = true, notify = false },
  change_detection = {
    enabled = true,
    notify = false,
  },
}
