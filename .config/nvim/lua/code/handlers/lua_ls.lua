local handler = function()
  local lsp_config = require 'lspconfig'

  lsp_config.lua_ls.setup {
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
            '${3rd}/luv/library',
            '${3rd}/busted/library',
            '~/.local/share/nvim/lazy/solarized.nvim',
          },
        },
      },
    },
  }
end

return handler
