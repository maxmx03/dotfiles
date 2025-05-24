return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'b0o/schemastore.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = {
        prefix = '󰯗',
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

    local lspconfig = require 'lspconfig'
    require('mason').setup()
    require('mason-lspconfig').setup {
      automatic_installation = true,
    }
    require('mason-tool-installer').setup {
      ensure_installed = {
        'shfmt',
        'stylua',
        'prettier',
        'prettierd',
        'markuplint',
        'black',
      },
      auto_update = true,
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
      'pyright',
      'svelte',
      'volar',
      'rust_analyzer',
    }
    for _, server in ipairs(servers) do
      -- vim.lsp.enable(server)
      -- vim.lsp.config(server, config)
      lspconfig[server].setup(config)
    end
    local handlers = {
      gopls = require 'config.handlers.gopls',
      jsonls = require 'config.handlers.jsonls',
      lua_ls = require 'config.handlers.lua_ls',
      marksman = require 'config.handlers.marksman',
      mdx_analyzer = require 'config.handlers.mdx_analyzer',
      ts_ls = require 'config.handlers.ts_ls',
      denols = require 'config.handlers.denols',
      emmet_language_server = require 'config.handlers.emmet_language_server',
    }
    for server, handler in pairs(handlers) do
      local cfg = vim.tbl_deep_extend('force', config, handler)
      -- vim.lsp.enable(server)
      -- vim.lsp.config(server, cfg)
      lspconfig[server].setup(cfg)
    end
  end,
}
