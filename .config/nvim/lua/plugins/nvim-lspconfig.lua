return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'b0o/schemastore.nvim',
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.diagnostic.config {
      virtual_text = {
        prefix = '',
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
          [vim.diagnostic.severity.HINT] = ' ',
        },
      },
    }
    vim.lsp.config('*', {
      capabilities = capabilities,
      root_markers = { '.git' },
    })
    local filemanager = require 'include.filemanager'
    local servers = filemanager.getfiles 'config/servers'
    for _, server in ipairs(servers) do
      local server_not_found, server_path = pcall(string.format, 'config.servers.%s', server)
      if not server_not_found then
        vim.notify((server_path .. ' path not found:'), vim.log.levels.WARN)
        return
      end
      local config_not_found, config = pcall(require, server_path)
      if not config_not_found then
        vim.notify((config .. ' config not found:'), vim.log.levels.WARN)
        return
      end
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
