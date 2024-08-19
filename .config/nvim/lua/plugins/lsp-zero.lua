local config = function()
  local lsp_zero = require 'lsp-zero'
  local code = require 'code'
  local gopls = require 'code.handlers.gopls'
  local lua_ls = require 'code.handlers.lua_ls'
  local pylsp = require 'code.handlers.pylsp'
  local tsserver = require 'code.handlers.tsserver'

  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local lsp_attach = function(client)
    if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)
    end
  end

  lsp_zero.extend_lspconfig {
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  require('mason').setup {}
  require('mason-lspconfig').setup {
    automatic_installation = true,
    ensure_installed = code.servers,
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup {}
      end,
      ['lua_ls'] = lua_ls,
      ['gopls'] = gopls,
      ['pylsp'] = pylsp,
      ['tsserver'] = tsserver,
    },
  }
end

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = config,
}
