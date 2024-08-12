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
      local colors = require('solarized.palette').get_colors()

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

          vim.api.nvim_set_hl(0, 'TabnineCodeLens', { fg = colors.magenta })
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

      lspconfig.lua_ls.setup {
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
              vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')
          then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = true,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          })
        end,
        settings = {
          Lua = {},
        },
      }

      for _, server in ipairs(servers) do
        if server ~= 'lua_ls' then
          lspconfig[server].setup {
            capabilities = capabilities,
          }
        end
      end
    end,
  },
}
