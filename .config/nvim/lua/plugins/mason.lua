local filemanager = require 'include.filemanager'
local servers = filemanager.getfiles 'config/servers'
local formatters = filemanager.getfiles 'config/formatters'
-- local linters = filemanager.getfiles('config/guard/linters')
-- local ensure_installed = vim.tbl_extend('force', linters or {}, formatters or {})
return {
  {
    'mason-org/mason.nvim',
    opts = {},
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
