return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local mason = require 'mason'
      local mason_lspconfig = require 'mason-lspconfig'
      local formatters = require 'milianor.formatters'
      local linters = require 'milianor.linters'
      local packages = formatters + linters
      local mason_installer = require 'mason-tool-installer'
      local lsp = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = require 'milianor.servers'
      local icons = require 'core.navic.icons'

      local signs = {
        Error = icons.diagnostics.Error,
        Warn = icons.diagnostics.Warning,
        Hint = icons.diagnostics.Hint,
        Info = icons.diagnostics.Information,
      }

      vim.diagnostic.config {
        virtual_text = {
          prefix = '●',
        },
        signs = {},
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local navic = require 'core.navic'

          if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(ev.buf, true)
          end

          navic.attach(client, ev.buf)
          vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
            buffer = ev.buf,
            command = 'update',
          })
        end,
      })

      mason.setup()
      mason_lspconfig.setup {
        automatic_installation = true,
      }
      mason_installer.setup {
        ensure_installed = packages,
        auto_update = true,
        run_on_start = true,
      }

      for _, server in ipairs(servers) do
        if server == 'lua_ls' then
          lsp[server].setup {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                },
                runtime = {
                  version = 'LuaJIT',
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
                telemetry = {
                  enable = false,
                },
                completion = {
                  enable = true,
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
