local function handler()
  local lsp_config = require 'lspconfig'
  lsp_config.pylsp.setup {
    plugins = {
      rope_autoimport = {
        enabled = true,
        completions = {
          enabled = true,
        },
        code_actions = {
          enabled = true,
        },
      },
    },
  }
end

return handler
