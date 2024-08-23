require 'lazy-bootstrap'
require 'editor'
local lazy = require 'lazy'

lazy.setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'solarized-light' } },
  checker = { enabled = true },
}
