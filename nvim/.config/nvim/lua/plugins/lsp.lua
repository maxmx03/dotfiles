return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'folke/neodev.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local mason = require 'mason'
      local masonlspconfig = require 'mason-lspconfig'
      local formatters = require 'milianor.formatters'
      local linters = require 'milianor.linters'
      local packages = formatters + linters
      local masontool = require 'mason-tool-installer'
      local neodev = require 'neodev'
      local lsp = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = require 'milianor.servers'

      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

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
          local wk = require 'which-key'

          wk.register({
            l = {
              name = ' LSP',
              d = { '<cmd>Lspsaga goto_definition<cr>', 'Definition' },
              h = { '<cmd>Lspsaga hover_doc<cr>', 'Hover' },
              s = { '<cmd>Telescope lsp_document_symbols theme=dropdown<cr>', 'Document Symbols' },
              r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
              c = { '<cmd>Lspsaga code_action<cr>', 'Code action' },
              f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format file' },
              e = { '<cmd>Lspsaga show_diagnostics<cr>', 'Show diagnostic' },
            },
          }, { prefix = '<space>' })
        end,
      })

      mason.setup()
      masonlspconfig.setup {
        automatic_installation = true,
      }
      masontool.setup {
        ensure_installed = packages,
        auto_update = true,
        run_on_start = true,
      }
      neodev.setup()

      for _, server in ipairs(servers) do
        if server == 'lua_ls' then
          lsp[server].setup {
            settings = {
              lua = {
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
            capabilities = capabilities,
          }
        else
          lsp[server].setup {
            capabilities = capabilities,
          }
        end
      end
    end,
  },
}
