local function navic_attach(client, bufnr)
  local navic = require 'nvim-navic'
  vim.g.navic_silence = false
  local symbols_supported = client.supports_method 'textDocument/documentSymbol'

  if not symbols_supported then
    return
  end

  navic.attach(client, bufnr)
end

return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      local mason = require 'mason'
      local mason_lspconfig = require 'mason-lspconfig'
      local mason_null_ls = require 'mason-null-ls'
      local lsp = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local milianor = require 'milianor'
      local icons = milianor.icons

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
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
          },
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          navic_attach(client, ev.buf)

          if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(ev.buf, true)
          end

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
      mason_null_ls.setup {
        automatic_installation = true,
      }

      for _, server in ipairs(milianor.servers) do
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
        elseif server == 'tsserver' then
          local function organize_imports()
            local params = {
              command = '_typescript.organizeImports',
              arguments = { vim.api.nvim_buf_get_name(0) },
              title = '',
            }
            vim.lsp.buf.execute_command(params)
          end
          lsp[server].setup {
            capabilities = capabilities,
            commands = {
              OrganizeImports = {
                organize_imports,
                description = 'Organize Imports',
              },
            },
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