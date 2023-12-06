require 'milianor'
require 'install-lazy'

local opts = {
  install = {
    missing = true,
    colorscheme = { 'tokyonight' },
  },
  checker = {
    enabled = true,
    concurrency = nil,
    notify = true,
    frequency = 3600,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
}

require('lazy').setup('plugins', opts)
