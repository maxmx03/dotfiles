return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  config = function()
    local icons = require 'utils.icons'
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

    require('mason').setup {}
    require('mason-null-ls').setup {
      automatic_installation = true,
    }
    require('mason-lspconfig').setup {
      automatic_installation = true,
    }
    require('mason-tool-installer').setup {
      auto_update = true,
      ensure_installed = {
        'shellcheck',
        'shfmt',
        'prettier',
        'prettierd',
        'stylua',
      },
    }
    local config = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    local servers = {
      'eslint',
      'html',
      'cssls',
      'cssmodules_ls',
      'vimls',
      'bashls',
      'angularls',
      'astro',
      'intelephense',
      'dockerls',
      'yamlls',
      'tailwindcss',
      'taplo',
      'clangd',
    }
    local lsp_config = require 'lspconfig'
    for _, server in ipairs(servers) do
      lsp_config[server].setup(config)
    end
    local handlers = {
      emmet_ls = require 'handlers.emmet_ls',
      gopls = require 'handlers.gopls',
      jsonls = require 'handlers.jsonls',
      lua_ls = require 'handlers.lua_ls',
      marksman = require 'handlers.marksman',
      mdx_analyzer = require 'handlers.mdx_analyzer',
      pylsp = require 'handlers.pylsp',
      ts_ls = require 'handlers.ts_ls',
    }
    for server, handler in pairs(handlers) do
      local cfg = vim.tbl_deep_extend('force', config, handler)
      lsp_config[server].setup(cfg)
    end
  end,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'jay-babu/mason-null-ls.nvim',
    'b0o/schemastore.nvim',
  },
}
