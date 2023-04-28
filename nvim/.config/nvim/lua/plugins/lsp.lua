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
          local bufnr = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local minimap = require 'mini.map'
          local wk = require 'which-key'
          local navic = require 'core.navic'

          navic.attach(client, bufnr)
          minimap.open()
          wk.register({
            l = {
              name = '󰀸 LSP',
              d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
              h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
              s = { '<cmd>Telescope lsp_document_symbols theme=dropdown<cr>', 'Document Symbols' },
              r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
              c = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code action' },
              f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format file' },
              e = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show diagnostic' },
            },
          }, { prefix = '<space>' })
        end,
      })

      mason.setup()
      masonlspconfig.setup {
        automatic_installation = true,
      }
      masontool.setup {
        ensure_installed = formatters,
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
