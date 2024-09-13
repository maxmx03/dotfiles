local config = function()
  local lsp_zero = require 'lsp-zero'
  local code = require 'code'
  local gopls = require 'code.handlers.gopls'
  local lua_ls = require 'code.handlers.lua_ls'
  local pylsp = require 'code.handlers.pylsp'
  local ts_ls = require 'code.handlers.ts_ls'
  local rust_analyzer = require 'code.handlers.rust_analyzer'
  local icons = require 'utils.icons'
  local emmet_ls = require 'code.handlers.emmet_ls'
  local mdx_analyzer = require 'code.handlers.mdx_analyzer'
  local marksman = require 'code.handlers.marksman'

  local signs = {
    Error = icons.diagnostics.Error,
    Warn = icons.diagnostics.Warning,
    Hint = icons.diagnostics.Hint,
    Info = icons.diagnostics.Information,
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config {
    virtual_text = {
      prefix = '󱋊',
    },
  }

  local lsp_attach = function(client, bufnr)
    if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)
    end
    if client ~= nil and vim.tbl_contains({ 'null-ls' }, client.name) then
      return
    end
    require('lsp_signature').on_attach({
      floating_window = false,
      hint_prefix = '🤔' .. ' ',
      hint_scheme = 'String',
    }, bufnr)
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
      ['ts_ls'] = ts_ls,
      ['rust_analyzer'] = rust_analyzer,
      ['emmet_ls'] = emmet_ls(),
      ['mdx_analyzer'] = mdx_analyzer(),
      ['marksman'] = marksman(),
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
