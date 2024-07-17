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
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          if
              client
              and client.server_capabilities
              and client.server_capabilities.inlayHintProvider
          then
            vim.lsp.inlay_hint.enable(true)
          end

          if client ~= nil and vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
            return
          end

          local breadcrumbs = require 'core.breadcrumbs'
          breadcrumbs.attach(client, bufnr)
          require('lsp_signature').on_attach({
            floating_window = false,
            hint_prefix = '🤔 ',
            hint_scheme = 'String',
          }, bufnr)
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

      for _, server in ipairs(servers) do
        if server == 'lua_ls' then
          lspconfig[server].setup {
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT',
                },
                workspace = {
                  checkThirdParty = true,
                },
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
