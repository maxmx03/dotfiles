local unix = require 'include.unix'
local servers = unix.ls 'config/servers'
local formatters = unix.ls('config/formatters', { 'fnlfmt' })
-- local linters = unix.ls 'config/linters'
-- local tools = vim.tbl_extend('force', linters or {}, formatters or {})
return {
  {
    'mason-org/mason.nvim',
    opts = {},
    keys = {
      { '<leader>mm', '<cmd>Mason<cr>', desc = 'packages' },
      { '<leader>ml', '<cmd>MasonLog<cr>', desc = 'logs' },
      { '<leader>mu', '<cmd>MasonUpdate<cr>', desc = 'update' },
      { '<leader>ma', '<cmd>MasonUpdate<cr>', desc = 'uninstall all' },
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = servers,
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = formatters,
      auto_update = true,
    },
  },
}
