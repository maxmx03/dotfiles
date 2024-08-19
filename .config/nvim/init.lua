require 'lazy-bootstrap'
require 'editor.options'
require 'editor.keymaps'
local lazy = require 'lazy'

lazy.setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'tokyonight-night' } },
  checker = { enabled = true },
}
