require 'milianor'
require 'install-lazy'

local opts = {
  install = {
    missing = true,
    colorscheme = { 'solarized' },
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
