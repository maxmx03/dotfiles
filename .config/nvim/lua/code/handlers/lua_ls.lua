local handler = function()
  local lsp_zero = require 'lsp-zero'
  local lsp_config = require 'lspconfig'

  lsp_config.lua_ls.setup {
    on_init = function(client)
      lsp_zero.nvim_lua_settings(client, {})
    end,
    settings = {
      Lua = {
        hint = {
          enable = true,
        },
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = true,
          library = {
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library",
            "${3rd}/busted/library",
          },
        },
      },
    },
  }
end

return handler
