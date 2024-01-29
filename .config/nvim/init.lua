require 'options'
require 'autocmds'
require 'bootstrap'

local opts = {
  install = {
    missing = true,
    colorscheme = { 'rose-pine' },
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
