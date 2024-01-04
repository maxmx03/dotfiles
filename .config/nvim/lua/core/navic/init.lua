local navic = require 'nvim-navic'
local M = {}

function M.attach(client, bufnr)
  vim.g.navic_silence = false
  local symbols_supported = client.supports_method 'textDocument/documentSymbol'

  if not symbols_supported then
    return
  end

  navic.attach(client, bufnr)
end

return M
