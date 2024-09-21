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
  },
  config = function()
    ---@type lsp-easy
    local lsp_easy = require 'lsp-easy'

    lsp_easy.setup {
      on_attach = function(client, bufnr)
        local lsp_signature = require 'lsp_signature'
        local wk = require 'which-key'

        if
            client
            and client.server_capabilities
            and client.server_capabilities.inlayHintProvider
        then
          vim.lsp.inlay_hint.enable(true)
        end

        if client ~= nil and vim.tbl_contains({ 'null-ls' }, client.name) then
          return
        end

        lsp_signature.on_attach({
          floating_window = false,
          hint_prefix = '🤔' .. ' ',
          hint_scheme = 'String',
        }, bufnr)

        local outline = {
          {
            '<Leader>lo',
            '<cmd>Lspsaga outline<CR>',
            desc = 'Saga Outline',
          },
        }

        if vim.bo.filetype == 'html' then
          outline[1][2] = '<cmd>AerialToggle<CR>'
          outline[1].desc = 'Aerial Outline'
          wk.add(outline)
        else
          wk.add(outline)
        end
      end,
      formatters = function(null_ls)
        return {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
        }
      end,
      diagnostics = function(null_ls)
        return {
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.markuplint,
          null_ls.builtins.diagnostics.checkmake,
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
        rust_analyzer = require 'code.handlers.rust_analyzer',
        ts_ls = require 'code.handlers.ts_ls',
      },
    }
  end,
}
