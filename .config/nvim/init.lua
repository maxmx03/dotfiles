require 'milianor.options'
require 'milianor.autocmd'
require 'bootstrap'

local opts = {
  install = {
    missing = true,
    colorscheme = { 'hydra' },
  },
  checker = {
    enabled = true,
    concurrency = nil,
    notify = false,
    frequency = 3600,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require('lazy').setup('plugins', opts)
