return {
  dir = vim.fn.stdpath 'config' .. '/lua/lsp-easy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'nvimtools/none-ls.nvim',
    'nvim-lua/plenary.nvim',
    'jay-babu/mason-null-ls.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    ---@type lsp-easy
    local lsp_easy = require 'lsp-easy'

    lsp_easy.setup {
      lspconfig = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = require 'code.on_attach',
      },
      mason_lspconfig = {
        automatic_installation = { exclude = { 'rust_analyzer' } },
      },
      mason_installer = {
        ensure_installed = { 'shellcheck', 'shfmt' },
      },
      formatters = function(formatting)
        return {
          formatting.stylua,
          formatting.prettierd,
        }
      end,
      diagnostics = function(diagnostics)
        return {
          diagnostics.markdownlint,
          diagnostics.markuplint,
          diagnostics.checkmake,
        }
      end,
      servers = {
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
      },
      handlers = {
        emmet_ls = require 'code.handlers.emmet_ls',
        gopls = require 'code.handlers.gopls',
        jsonls = require 'code.handlers.jsonls',
        lua_ls = require 'code.handlers.lua_ls',
        marksman = require 'code.handlers.marksman',
        mdx_analyzer = require 'code.handlers.mdx_analyzer',
        pylsp = require 'code.handlers.pylsp',
        ts_ls = require 'code.handlers.ts_ls',
        rust_analyzer = require 'code.handlers.rust_analyzer',
      },
    }
  end,
}
