require 'lazy.config'
require 'options'
require 'autocmds'
require 'maps'
local lazy = require 'lazy'

lazy.setup {
  spec = {
    { import = 'plugins' },
  },
  install = {
    checker = { enabled = true, notify = false },
  },
  change_detection = {
    enable = true,
    notify = false,
  },
}
