local function handler()
  local lsp_config = require 'lspconfig'
  lsp_config.marksman.setup {
    filetypes = {
      'markdown',
    },
  }
end

return handler
