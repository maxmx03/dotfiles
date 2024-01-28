return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local neodev = require 'neodev'
      local mason = require 'mason'
      local masonlspconfig = require 'mason-lspconfig'
      local formatters = require 'formatters'
      local linters = require 'linters'
      local packages = vim.list_extend(formatters, linters)
      local masontool = require 'mason-tool-installer'
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local icons = require 'core.icons'
      local servers = require 'servers'

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
          prefix = '●',
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),

        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local bufnr = ev.buf
          require('core.auto-save').on_attach(bufnr)
        end,
      })

      neodev.setup {}
      mason.setup()
      masonlspconfig.setup {
        automatic_installation = true,
      }
      masontool.setup {
        ensure_installed = packages,
        auto_update = true,
        run_on_start = true,
      }

      for _, server in ipairs(servers) do
        if server == 'lua_ls' then
          lspconfig[server].setup {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                },
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
            capabilities = capabilities,
          }
        else
          lspconfig[server].setup {
            capabilities = capabilities,
          }
        end
      end
    end,
  },
}
