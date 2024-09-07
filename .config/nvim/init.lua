require 'lazy-bootstrap'
require 'editor'
local lazy = require 'lazy'

vim.cmd.colorscheme 'github'

lazy.setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'github' } },
  checker = { enabled = true, notify = false },
  change_detection = {
    enable = true,
    notify = false,
  },
}
