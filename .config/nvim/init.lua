require 'lazy-bootstrap'
require 'editor'
local lazy = require 'lazy'

lazy.setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'solarized-light' } },
  checker = { enabled = true, notify = false },
  change_detection = {
    enable = true,
    notify = false,
  },
}
